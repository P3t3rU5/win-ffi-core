module WinFFI
  extend LibBase

  LR = enum :lr, [
          :DEFAULTCOLOR, 0x00000000, # The default flag; it does nothing. All it means is "not :MONOCHROME".

          :MONOCHROME, 0x00000001, # Loads the image in black and white.

          :LOADTRANSPARENT, 0x00000020, # Retrieves the color value of the first pixel in the image and replaces the
          # corresponding entry in the color table with the default window color (COLOR_WINDOW). All pixels in the image
          # that use that entry become the default window color. This value applies only to images that have corresponding
          # color tables.

          :DEFAULTSIZE, 0x00000040, # Uses the width or height specified by the system metric values for cursors or icons,
          # if the cxDesired or cyDesired values are set to zero. If this flag is not specified and cxDesired and
          # cyDesired are set to zero, the function uses the actual resource size. If the resource contains multiple
          # images, the function uses the size of the first image.

          :LOADFROMFILE, 0x00000010, # Loads the stand-alone image from the file specified by lpszName (icon, cursor, or
          # bitmap file).

          :LOADMAP3DCOLORS, 0x00001000, # Searches the color table for the image and replaces the following shades of gray
          # with the corresponding 3-D color.
          #Dk Gray, RGB(128,128,128) with COLOR_3DSHADOW
          #Gray, RGB(192,192,192) with COLOR_3DFACE
          #Lt Gray, RGB(223,223,223) with COLOR_3DLIGHT
          # Do not use this option if you are loading a bitmap with a color depth greater than 8bpp.

          :CREATEDIBSECTION, 0x00002000, # When the uType parameter specifies IMAGE_BITMAP, causes the function to return
          # a DIB section bitmap rather than a compatible bitmap. This flag is useful for loading a bitmap without mapping
          # it to the colors of the display device.
          # Do not use this option if you are loading a bitmap with a color depth greater than 8bpp.
          # If fuLoad includes both the :LOADTRANSPARENT and :LOADMAP3DCOLORS values, :LOADTRANSPARENT takes precedence.
          # However, the color table entry is replaced with COLOR_3DFACE rather than COLOR_WINDOW.

          :SHARED, 0x00008000, # Shares the image handle if the image is loaded multiple times. If :SHARED is not set, a
          # second call to LoadImage for the same resource will load the image again and return a different handle.
          # When you use this flag, the system will destroy the resource when it is no longer needed.
          # Do not use :SHARED for images that have non-standard sizes, that may change after loading, or that are loaded
          # from a file. When loading a system icon or cursor, you must use :SHARED or the function will fail to load the
          # resource. This function finds the first image in the cache with the requested resource name, regardless of the
          # size requested.

          :VGACOLOR, 0x00000080, # Uses true VGA colors.
      ]
end