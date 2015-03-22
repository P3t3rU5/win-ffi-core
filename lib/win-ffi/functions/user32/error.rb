module WinFFI
  ffi_lib 'user32'

  #void WINAPI SetLastErrorEx(
  #  _In_  DWORD dwErrCode,
  #  _In_  DWORD dwType )
  attach_function 'SetLastErrorEx', [:dword, :dword], :void
end