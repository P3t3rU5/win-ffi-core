require 'win-ffi/gdi32/enum/text/pan_family'
require 'win-ffi/gdi32/enum/text/pan_serif_style'
require 'win-ffi/gdi32/enum/text/pan_weight'
require 'win-ffi/gdi32/enum/text/pan_proportion'
require 'win-ffi/gdi32/enum/text/pan_contrast'
require 'win-ffi/gdi32/enum/text/pan_stroke_variation'
require 'win-ffi/gdi32/enum/text/pan_arm_style'
require 'win-ffi/gdi32/enum/text/pan_letter_form'
require 'win-ffi/gdi32/enum/text/pan_midline'
require 'win-ffi/gdi32/enum/text/pan_x_height'


module WinFFI
  module Gdi32
    # https://msdn.microsoft.com/en-us/library/dd162774(v=vs.85).aspx
    class PANOSE < FFIStruct
      layout :FamilyType,      PanFamily,
             :SerifStyle,      PanSerifStyle,
             :Weight,          PanWeight,
             :Proportion,      PanProportion,
             :Contrast,        PanContrast,
             :StrokeVariation, PanStrokeVariation,
             :ArmStyle,        PanArmStyle,
             :Letterform,      PanLetterForm,
             :Midline,         PanMidline,
             :XHeight,         PanXHeight
    end
  end
end