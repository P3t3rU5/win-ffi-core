require 'win-ffi/user32'

require 'win-ffi/user32/struct/interaction/input_message_source'

module WinFFI
  module User32
    if WindowsVersion >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/jj553553(v=vs.85).aspx
      # GetCIMSSM may be altered or unavailable in the future. Instead, use GetCurrentInputMessageSource.
      # BOOL GetCIMSSM(_Out_ INPUT_MESSAGE_SOURCE *inputMessageSource);
      attach_function 'GetCIMSSM', [INPUT_MESSAGE_SOURCE], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448793(v=vs.85).aspx
      #BOOL GetCurrentInputMessageSource( _Out_  INPUT_MESSAGE_SOURCE *inputMessageSource )
      attach_function 'GetCurrentInputMessageSource', [INPUT_MESSAGE_SOURCE], :bool
    end
  end
end