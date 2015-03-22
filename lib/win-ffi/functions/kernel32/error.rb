require_relative '../../enums/kernel32/format_message_flags'
require_relative '../../enums/kernel32/set_error_mode_flags'

module WinFFI
  module Kernel32
    #xp
    #DWORD WINAPI GetLastError(void)
    attach_function 'GetLastError', [], :dword

    #void WINAPI SetLastError( _In_  DWORD dwErrCode )
    attach_function 'SetLastError', [:dword], :void

    #UINT WINAPI SetErrorMode( _In_  UINT uMode )
    attach_function 'SetErrorMode', [SetErrorModeFlags], :int

    #DWORD WINAPI FormatMessage(
    #  _In_      DWORD dwFlags,
    #  _In_opt_  LPCVOID lpSource,
    #  _In_      DWORD dwMessageId,
    #  _In_      DWORD dwLanguageId,
    #  _Out_     LPTSTR lpBuffer,
    #  _In_      DWORD nSize,
    #  _In_opt_  va_list *Arguments )
    attach_function 'FormatMessageA', [FormatMessageFlags, :pointer, :dword, :dword, :pointer, :dword, :pointer], :dword
    attach_function 'FormatMessageW', [FormatMessageFlags, :pointer, :dword, :dword, :pointer, :dword, :pointer], :dword
  end
end
