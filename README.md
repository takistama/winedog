# winedog

IMPORTANT: I (might) rewrite it in c++ because it will be easier to implement some higher level features down the road

winedog is a simple kernel I wrote to relearn C and x86_asm. It runs in 32bit mode and uses GRUB as a bootloader to satisfy my lazy side.

  - Currently has a (basic) C library that allows for (simple task) commands to be created.
  - Supports full QWERTY keyboard mapping including non typist keys such as ScrLk and NumLk.

# Requirements

  - gcc
  - grub2
  - make
  - nasm
  - xorriso

# Usage

There is an `iso` in versions. Just create a virtual machine in VMWare or whatever you use, and set the iso as the boot image. It requires an incredibly low amount of ram too, so you can run it in the background if for some reason you actually need to (You don't; all you can do is shut it down at the moment.)

# Building

Install all the requirements (I used ubuntu WSL and had no issues) and execute the following:

```shell
$ cd ~/path/to/winedog/
$ make
```

This will put an `iso' in the main project directory, which can be run in a virtualized environment.
