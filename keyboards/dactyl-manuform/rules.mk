SRC += matrix.c \
	   split_util.c \
	   serial.c
#    i2c.c \

# MCU name
#MCU = at90usb1287
MCU = atmega32u4

# Processor frequency.
#     This will define a symbol, F_CPU, in all source code files equal to the
#     processor frequency in Hz. You can then use this symbol in your source code to
#     calculate timings. Do NOT tack on a 'UL' at the end, this will be done
#     automatically to create a 32-bit value in your source code.
#
#     This will be an integer division of F_USB below, as it is sourced by
#     F_USB after it has run through any CPU prescalers. Note that this value
#     does not *change* the processor frequency - it should merely be updated to
#     reflect the processor speed set externally so that the code can use accurate
#     software delays.
F_CPU = 16000000

#
# LUFA specific
#
# Target architecture (see library "Board Types" documentation).
ARCH = AVR8

# Input clock frequency.
#     This will define a symbol, F_USB, in all source code files equal to the
#     input clock frequency (before any prescaling is performed) in Hz. This value may
#     differ from F_CPU if prescaling is used on the latter, and is required as the
#     raw input clock is fed directly to the PLL sections of the AVR for high speed
#     clock generation for the USB and other AVR subsections. Do NOT tack on a 'UL'
#     at the end, this will be done automatically to create a 32-bit value in your
#     source code.
#
#     If no clock division is performed on the input clock inside the AVR (via the
#     CPU clock adjust registers or the clock division fuses), this will be equal to F_CPU.
F_USB = $(F_CPU)

# Interrupt driven control endpoint task(+60)
OPT_DEFS += -DINTERRUPT_CONTROL_ENDPOINT


# Boot Section Size in *bytes*
#   Teensy halfKay   512
#   Teensy++ halfKay 1024
#   Atmel DFU loader 4096
#   LUFA bootloader  4096
#   USBaspLoader     2048
OPT_DEFS += -DBOOTLOADER_SIZE=4096

# Build Options
#   change to "no" to disable the options, or define them in the Makefile in
#   the appropriate keymap folder that will get included automatically
#
BOOTMAGIC_ENABLE ?= yes       # Virtual DIP switch configuration(+1000)
MOUSEKEY_ENABLE ?= no       # Mouse keys(+4700)
EXTRAKEY_ENABLE ?= yes       # Audio control and System control(+450)
CONSOLE_ENABLE ?= yes         # Console for debug(+400)
COMMAND_ENABLE ?= no        # Commands for debug and configuration
NKRO_ENABLE ?= yes            # Nkey Rollover - if this doesn't work, see here: https://github.com/tmk/tmk_keyboard/wiki/FAQ#nkro-doesnt-work
BACKLIGHT_ENABLE ?= no      # Enable keyboard backlight functionality
MIDI_ENABLE ?= no            # MIDI controls
AUDIO_ENABLE ?= no           # Audio output on port C6
UNICODE_ENABLE ?= no         # Unicode
BLUETOOTH_ENABLE ?= no       # Enable Bluetooth with the Adafruit EZ-Key HID
RGBLIGHT_ENABLE ?= no       # Enable WS2812 RGB underlight.  Do not enable this with audio at the same time.
SUBPROJECT_rev1 ?= no
USE_I2C ?= no
# Do not enable SLEEP_LED_ENABLE. it uses the same timer as BACKLIGHT_ENABLE
SLEEP_LED_ENABLE ?= no    # Breathing sleep LED during USB suspend

CUSTOM_MATRIX = yes

avrdude: build
	ls /dev/tty* > /tmp/1; \
	echo "Reset your Pro Micro now"; \
	while [ -z $$USB ]; do \
	  sleep 1; \
	  ls /dev/tty* > /tmp/2; \
	  USB=`diff /tmp/1 /tmp/2 | grep -o '/dev/tty.*'`; \
	done; \
	avrdude -p $(MCU) -c avr109 -P $$USB -U flash:w:$(BUILD_DIR)/$(TARGET).hex

.PHONY: avrdude
