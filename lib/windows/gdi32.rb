module WinFFI
	module Gdi32
		extend LibBase
		ffi_lib 'gdi32'

		LOGPIXELSX = 88
		LOGPIXELSY = 90

		FONT_CHARSETS = {
			:ANSI        => 0,
			:DEFAULT     => 1,
			:SYMBOL      => 2,
			:MAC         => 77,
			:SHIFTJIS    => 128,
			:HANGUL      => 129,
			:JOHAB       => 130,
			:GB2312      => 134,
			:CHINESEBIG5 => 136,
			:GREEK       => 161,
			:TURKISH     => 162,
			:VIETNAMESE  => 163,
			:HEBREW      => 177,
			:ARABIC      => 178,
			:BALTIC      => 186,
			:RUSSIAN     => 204,
			:THAI        => 222,
			:EASTEUROPE  => 238,
			:OEM         => 255,
		}

		FONT_CLIP_PRECISION = {
			:DEFAULT_PRECIS   => 0x00,
			:CHARACTER_PRECIS => 0x01,
			:STROKE_PRECIS    => 0x02,
			:LH_ANGLES        => 0x10,
			:TT_ALWAYS        => 0x20,
			:DFA_DISABLE      => 0x40,
			:EMBEDDED         => 0x80,
			:MASK             => 0x0f,
		}

		FONT_FAMILY_PITCH = {
			:DEFAULT_PITCH     => 0x00,
			:FIXED_PITCH       => 0x01,
			:VARIABLE_PITCH    => 0x02,
			:FAMILY_DONTCARE   => 0x00,
			:FAMILY_ROMAN      => 0x10,
			:FAMILY_SWISS      => 0x20,
			:FAMILY_MODERN     => 0x30,
			:FAMILY_SCRIPT     => 0x40,
			:FAMILY_DECORATIVE => 0x50,
		}

		FONT_OUTPUT_PRECISION = {
			:DEFAULT        => 0,
			:STRING         => 1,
			:CHARACTER      => 2,
			:STROKE         => 3,
			:TT             => 4,
			:DEVICE         => 5,
			:RASTER         => 6,
			:TT_ONLY        => 7,
			:OUTLINE        => 8,
			:SCREEN_OUTLINE => 9,
			:PS_ONLY        => 10,
		}

		FONT_QUALITY = {
			:DEFAULT        => 0,
			:DRAFT          => 1,
			:PROOF          => 2,
			:NONANTIALIASED => 3,
			:ANTIALIASED    => 4,
			:CLEARTYPE      => 5,
		}

		FONT_WEIGHTS = {
			:DONTCARE   => 0,
			:THIN       => 100,
			:EXTRALIGHT => 200,
			:LIGHT      => 300,
			:NORMAL     => 400,
			:MEDIUM     => 500,
			:SEMIBOLD   => 600,
			:BOLD       => 700,
			:EXTRABOLD  => 800,
			:HEAVY      => 900,
		}

	end
end

%w'log_brush palette_entry'.each { |f| require_relative "gdi32/structs/#{f}" }
%w'
  bitmap
  brush
  device_context
  filled_shape
  metafile
  multiple_display_monitors
  opengl
  painting_drawing
  print
  text
  transform
'.each { |f| require_relative "gdi32/#{f}" }