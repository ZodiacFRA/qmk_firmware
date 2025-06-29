# Quantum Mechanical Keyboard Firmware

[![Build Status](https://travis-ci.org/qmk/qmk_firmware.svg?branch=master)](https://travis-ci.org/qmk/qmk_firmware) [![Gitter](https://badges.gitter.im/qmk/qmk_firmware.svg)](https://gitter.im/qmk/qmk_firmware?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

This is a keyboard firmware based on the [tmk_keyboard firmware](http://github.com/tmk/tmk_keyboard) with some useful features for Atmel AVR controllers, and more specifically, the [OLKB product line](http://olkb.com), the [ErgoDox EZ](http://www.ergodox-ez.com) keyboard, and the [Clueboard product line](http://clueboard.co/).

## Official website (currently under construction with the move to the wiki)

For an easy-to-read version of this document and the repository, check out [http://qmk.fm](http://qmk.fm). Nicely formatted keyboard and keymap listings are also available there, along with the ability to download .hex files instead of having to setup a build environment and compile them.

## NDLR: 
I removed all keyboards apart from the dactyl-manuform which is the one I used

## Hardware 

I used cosmos to generate the stl promicro holders
Wiring is based on https://github.com/abstracthat/dactyl-manuform 

![Left Wire Diagram](imgs/dactyl_manuform_left_wire_diagram.png)
![Right Wire Diagram](imgs/dactyl_manuform_right_wire_diagram.png)

I used copper stripes for columns, diodes legs for the rows, TRS connectors between each side using serial (no I2C)

Printed on a Bambulab X1 Carbon, nice print but the switches could benefit from a tighter fit 

## Software

For this new build I first tried to make it work using the upstream QMK without success 
(this may be caused by incorrect pins, which I had to change here as well)

I then fell back to this fork https://github.com/tshort/qmk_firmware as I knew it worked thanks to my previous build

## TODO:
- Nkro does not work, even if enabled in rules.mk
    As suggested in the comment: # Nkey Rollover - if this doesn't work, see here: https://github.com/tmk/tmk_keyboard/wiki/FAQ#nkro-doesnt-work

- use upstream QMK and set the proper pins (like in this config.h) to make it work? 

- volume up / down / mute does not work