<div align = "center">

<h1><a href="https://2kabhishek.github.io/committer">BareMinimum</a></h1>

<a href="https://github.com/2KAbhishek/committer/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/2kabhishek/committer?style=flat&color=eee&label="> </a>

<a href="https://github.com/2KAbhishek/committer/graphs/contributors">
<img alt="People" src="https://img.shields.io/github/contributors/2kabhishek/committer?style=flat&color=ffaaf2&label=People"> </a>

<a href="https://github.com/2KAbhishek/committer/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/2kabhishek/committer?style=flat&color=98c379&label=Stars"></a>

<a href="https://github.com/2KAbhishek/committer/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/2kabhishek/committer?style=flat&color=66a8e0&label=Forks"> </a>

<a href="https://github.com/2KAbhishek/committer/watchers">
<img alt="Watches" src="https://img.shields.io/github/watchers/2kabhishek/committer?style=flat&color=f5d08b&label=Watches"> </a>

<a href="https://github.com/2KAbhishek/committer/pulse">
<img alt="Last Updated" src="https://img.shields.io/github/last-commit/2kabhishek/committer?style=flat&color=e06c75&label="> </a>

</div>

committer is a tool that allows developers to quickly commit files to git.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed `git`

## Installing

To install committer, follow these steps:

```bash
git clone https://github.com/2kabhishek/committer
cd committer
# Setup symlink, make sure target directory is added to PATH
ln -sfnv $PWD/committer.sh ~/Applications/bin/committer
```

## Using committer

```bash
USAGE:
    committer [FLAGS]

FLAGS:
                    Select files sorted newest first
    -a              Batch commit files oldest first
    -n              Select files sorted by name
    -an | -na       Batch commit files sorted by name
    -h              Show help

```
