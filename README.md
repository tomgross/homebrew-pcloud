# pCloud homebrew tap

A tap for homebrew to install pCloud Drive on Mac.

## Install

```bash
brew install --cask tomgross/pcloud/pcloud
```

## Updating

1. Get key

```bash
echo `curl -s https://www.pcloud.com/how-to-install-pcloud-drive-mac-os.html\?download\=mac | grep "'Mac':" | sed "s/[ ,:']*//g;s/Mac//g" | tr -d '\t'`
```

2. Download latest pkg Version from https://www.pcloud.com/de/how-to-install-pcloud-drive-mac-os.html

3. Calculate SHA256 sum

```bash
shasum -a 256 pCloud\ Drive\ 3.9.10.pkg
```

4. Update values (*version*, *sha256*, *code*, *pkg*) in cask formula
