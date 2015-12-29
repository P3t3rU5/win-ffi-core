require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= :xp

      #BOOL WINAPI AttachThreadInput(
      #  _In_  DWORD idAttach,
      #  _In_  DWORD idAttachTo,
      #  _In_  BOOL fAttach )
      attach_function 'AttachThreadInput', [:dword, :dword, :bool], :bool

    end
  end
end