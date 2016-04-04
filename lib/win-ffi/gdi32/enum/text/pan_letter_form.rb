require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanLetterForm = enum :pan_letter_form, [
        :ANY,                 0, # Any
        :NO_FIT,              1, # No Fit
        :NORMAL_CONTACT,      2, # Normal/Contact
        :NORMAL_WEIGHTED,     3, # Normal/Weighted
        :NORMAL_BOXED,        4, # Normal/Boxed
        :NORMAL_FLATTENED,    5, # Normal/Flattened
        :NORMAL_ROUNDED,      6, # Normal/Rounded
        :NORMAL_OFF_CENTER,   7, # Normal/Off Center
        :NORMAL_SQUARE,       8, # Normal/Square
        :OBLIQUE_CONTACT,     9, # Oblique/Contact
        :OBLIQUE_WEIGHTED,   10, # Oblique/Weighted
        :OBLIQUE_BOXED,      11, # Oblique/Boxed
        :OBLIQUE_FLATTENED,  12, # Oblique/Flattened
        :OBLIQUE_ROUNDED,    13, # Oblique/Rounded
        :OBLIQUE_OFF_CENTER, 14, # Oblique/Off Center
        :OBLIQUE_SQUARE,     15, # Oblique/Square
    ]
  end
end