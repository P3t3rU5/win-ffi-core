require 'win-ffi/secur32'

require 'win-ffi/secur32/enum/extended_name_format'

module WinFFI
  module Secur32

    #BOOLEAN WINAPI GetComputerObjectName(
    #  _In_     EXTENDED_NAME_FORMAT NameFormat,
    #  _Out_    LPTSTR lpNameBuffer,
    #  _Inout_  PULONG lpnSize )
    encoded_function 'GetComputerObjectName', [ExtendedNameFormat ,:pointer, :pointer], :bool

    #BOOLEAN WINAPI GetUserNameEx(
    #  _In_     EXTENDED_NAME_FORMAT NameFormat,
    #  _Out_    LPTSTR lpNameBuffer,
    #  _Inout_  PULONG lpnSize )
    encoded_function 'GetUserNameEx', [ExtendedNameFormat, :pointer, :pointer], :bool

    #BOOLEAN WINAPI TranslateName(
    #  _In_     LPCTSTR lpAccountName,
    #  _In_     EXTENDED_NAME_FORMAT AccountNameFormat,
    #  _In_     EXTENDED_NAME_FORMAT DesiredNameFormat,
    #  _Out_    LPTSTR lpTranslatedName,
    #  _Inout_  PULONG nSize )
    encoded_function 'TranslateName', [:string, ExtendedNameFormat, ExtendedNameFormat, :string, :pointer], :bool
  end
end