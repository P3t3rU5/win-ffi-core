module WinFFI
  module Comctl32
    #void DrawInsert(
    #  HWND handParent,
    #  HWND hLB,
    #  int nItem )
    attach_function 'DrawInsert', [:hwnd, :hwnd, :int], :void

    #int LBItemFromPt(
    #  HWND hLB,
    #  POINT pt,
    #  BOOL bAutoScroll )
    attach_function 'LBItemFromPt', [:hwnd, POINT, :bool], :int

    #BOOL MakeDragList( HWND hLB )
    attach_function 'MakeDragList', [:hwnd], :bool
  end
end