# auto-install-zeek
One key install zeek(bro) on Linux
## Background
Zeek is an outstanding tool for IDS. However, the process of installing zeek is somehow cumbersome.
- For clone recursively: **too slow**
- For download non-recursive pack: **too much dependencies**

So here comes the auto install script.

## Usage
Download or clone this repo
```bash
# download
wget https://raw.githubusercontent.com/QGrain/auto-install-zeek/master/one-key-install.sh

# clone
git clone https://github.com/QGrain/auto-install-zeek.git
```
Get start
```bash
./auto-install-zeek/one-key-install.sh
```

## Todo
- [ ] Check for potential bugs
- [ ] Add support for installing from non-recursive-clone

## Change Log
**v0.1.0 (2020-03-13) :beer:**
- Add basic support for installing with a recursive-clone from zeek/zeek

## OpenSource
MIT License
Welcome star, fork and any issue :thumbsup:
