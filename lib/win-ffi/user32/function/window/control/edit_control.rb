require 'win-ffi/user32'

module WinFFI
  module User32
    # int CALLBACK EditWordBreakProc(
    #   _In_ LPTSTR lpch,
    #   _In_ int    ichCurrent,
    #   _In_ int    cch,
    #   _In_ int    code )
    EditWordBreakProc = callback 'EditWordBreakProc', [:pointer, :int, :int, :int], :int

  end
end