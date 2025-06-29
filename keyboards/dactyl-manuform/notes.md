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