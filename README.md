<div align = "center">

<h1><a href="https://2kabhishek.github.io/cmtr">cmtr</a></h1>

<a href="https://github.com/2KAbhishek/cmtr/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/2kabhishek/cmtr?style=flat&color=eee&label="> </a>

<a href="https://github.com/2KAbhishek/cmtr/graphs/contributors">
<img alt="People" src="https://img.shields.io/github/contributors/2kabhishek/cmtr?style=flat&color=ffaaf2&label=People"> </a>

<a href="https://github.com/2KAbhishek/cmtr/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/2kabhishek/cmtr?style=flat&color=98c379&label=Stars"></a>

<a href="https://github.com/2KAbhishek/cmtr/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/2kabhishek/cmtr?style=flat&color=66a8e0&label=Forks"> </a>

<a href="https://github.com/2KAbhishek/cmtr/watchers">
<img alt="Watches" src="https://img.shields.io/github/watchers/2kabhishek/cmtr?style=flat&color=f5d08b&label=Watches"> </a>

<a href="https://github.com/2KAbhishek/cmtr/pulse">
<img alt="Last Updated" src="https://img.shields.io/github/last-commit/2kabhishek/cmtr?style=flat&color=e06c75&label="> </a>

</div>

cmtr is a tool that allows developers to quickly commit files to git.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed `git`

## Installing

To install cmtr, follow these steps:

```bash
git clone https://github.com/2kabhishek/cmtr
cd cmtr
# Setup symlink, make sure target directory is added to PATH
ln -sfnv $PWD/cmtr.sh ~/.local/bin/cmtr
```

## Using cmtr

```bash
USAGE:
    cmtr [FLAGS]

FLAGS:
                    Select files sorted newest first
    -a              Batch commit files oldest first
    -n              Select files sorted by name
    -an | -na       Batch commit files sorted by name
    -h              Show help

```
