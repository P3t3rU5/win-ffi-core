require 'win-ffi/comctl32'

module WinFFI
  module Comctl32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761723(v=vs.85).aspx
    # void DrawInsert(
    #   HWND handParent,
    #   HWND hLB,
    #   int nItem )
    attach_function 'DrawInsert', [:hwnd, :hwnd, :int], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761724(v=vs.85).aspx
    # int LBItemFromPt(
    #   HWND hLB,
    #   POINT pt,
    #   BOOL bAutoScroll )
    attach_function 'LBItemFromPt', [:hwnd, POINT, :bool], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761725(v=vs.85).aspx
    # BOOL MakeDragList( HWND hLB )
    attach_function 'MakeDragList', [:hwnd], :bool
  end
end