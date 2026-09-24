"""Point Casks/deckboy.rb at Deckboy's latest release: version and both hashes."""
import hashlib
import json
import os
import re
import urllib.request

REPO = "Utopian-Academy/Deckboy"
CASK = "Casks/deckboy.rb"


def get(url):
    headers = {"User-Agent": "homebrew-deckboy-bump"}
    # Anonymous API calls share a 60-an-hour limit with every other job on
    # the runner's address. The token goes to the API only: the downloads
    # redirect to other hosts, which must not receive it.
    if url.startswith("https://api.github.com/") and os.environ.get("GITHUB_TOKEN"):
        headers["Authorization"] = "Bearer " + os.environ["GITHUB_TOKEN"]
    req = urllib.request.Request(url, headers=headers)
    return urllib.request.urlopen(req, timeout=300)


latest = json.load(get("https://api.github.com/repos/%s/releases/latest" % REPO))
version = latest["tag_name"].lstrip("v")
text = open(CASK, encoding="utf-8").read()
current = re.search(r'version "([^"]+)"', text).group(1)
if version == current:
    print("already on", version)
    raise SystemExit(0)

hashes = {}
for arch in ("arm64", "x86_64"):
    url = "https://github.com/%s/releases/download/v%s/Deckboy-%s-macos-%s.dmg" % (REPO, version, version, arch)
    digest = hashlib.sha256()
    with get(url) as r:
        for chunk in iter(lambda: r.read(1 << 20), b""):
            digest.update(chunk)
    hashes[arch] = digest.hexdigest()

text = text.replace('version "%s"' % current, 'version "%s"' % version)
text = re.sub(r'arm:\s+"[0-9a-f]{64}"', 'arm:   "%s"' % hashes["arm64"], text)
text = re.sub(r'intel: "[0-9a-f]{64}"', 'intel: "%s"' % hashes["x86_64"], text)
open(CASK, "w", encoding="utf-8").write(text)
print("bumped", current, "->", version)
with open(os.environ.get("GITHUB_OUTPUT", os.devnull), "a") as out:
    out.write("bumped=%s\n" % version)
