module WinFFI
  module Gdi32
    extend LibBase

    ffi_lib 'gdi32'

    require_relative '../enums/gdi32'

    %i'rect point size'.each { |f| require_relative "../structs/#{f}" }

    %i'
      bitmap
      brush
      device_context
      filled_shape
      metafile
      opengl
      painting_drawing
      text
    '.each { |f| require_relative "../functions/gdi32/#{f}" }
  end
end