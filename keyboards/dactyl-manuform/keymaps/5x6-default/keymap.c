#include "dactyl-manuform.h"
#include "action_layer.h"
#include "eeconfig.h"

extern keymap_config_t keymap_config;

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _QWERTY 0
#define _FN   1

// Fillers to make layering more clear
#define _______ KC_TRNS
#define XXXXXXX KC_NO

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[_QWERTY] = KEYMAP_5x6(
  // left hand
   KC_ESC,    KC_1,    KC_2,    KC_3,   KC_4,    KC_5, 
   KC_TAB,    KC_A,    KC_Z,    KC_E,   KC_R,    KC_T,
   KC_LSHIFT, KC_Q,    KC_S,    KC_D,   KC_F,    KC_G,
   KC_LCTRL,  KC_GRV,  KC_W,    KC_X,   KC_C,    KC_V,
                       KC_BSLS, KC_QUOT,
                                        KC_LGUI, KC_LALT, 
                                        _______, KC_SPC,
                                        _______, _______,

                                                                      // right hand
                                                                                    KC_6,    KC_7,   KC_8,    KC_9,    KC_0,    KC_DEL,
                                                                                    KC_Y,    KC_U,   KC_I,    KC_O,    KC_P,    KC_EQL,
                                                                                    KC_H,    KC_J,   KC_K,    KC_L,    KC_M,    KC_MINS, 
                                                                                    KC_B,    KC_N,   KC_COMM, KC_DOT,  KC_SLSH, KC_SCLN,
                                                                                                     KC_LBRC, KC_RBRC,
                                                                      KC_BSPC, LT(_FN, KC_ENTER), 
                                                                      KC_SPC,  KC_A,
                                                                      KC_B, KC_C),

[_FN] = KEYMAP_5x6(
  // left hand
   _______, KC_F1,   KC_F2,    KC_F3,   KC_F4,    KC_F5, 
   KC_CAPS, KC_VOLU, KC_HOME,  KC_UP,   KC_END,   KC_PGUP,
   _______, KC_VOLD, KC_LEFT,  KC_DOWN, KC_RIGHT, KC_PGDN,
   _______, KC_MUTE, _______,  _______, _______,  _______,
                     RESET,    _______,
                                        KC_LGUI,  KC_LALT, 
                                        _______,  KC_SPC,
                                        _______,  _______,

                                                                      // right hand
                                                                                    KC_F6,    KC_F7,    KC_F8,    KC_F9,     KC_F10,  KC_F11,
                                                                                    KC_MNXT,  KC_HOME,  KC_UP,    KC_END,   _______,  KC_F12,
                                                                                    KC_MPRV,  KC_LEFT,  KC_DOWN,  KC_RIGHT, _______, _______,
                                                                                    KC_MPLY,  _______,  _______,  _______,  _______, _______,
                                                                                                        _______,  RESET,
                                                                      KC_BSPC, LT(_FN, KC_ENTER), 
                                                                      KC_SPC,  KC_A,
                                                                      KC_B, KC_C),
};



void persistant_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}
