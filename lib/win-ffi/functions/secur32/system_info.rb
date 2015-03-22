module WinFII
  module Secur32
    extend LibBase

    ffi_lib 'secur32'

    #BOOLEAN WINAPI GetComputerObjectName(
    #  _In_     EXTENDED_NAME_FORMAT NameFormat,
    #  _Out_    LPTSTR lpNameBuffer,
    #  _Inout_  PULONG lpnSize )
    attach_function 'GetComputerObjectNameA', [ExtendedNameFormat ,:pointer, :pointer], :bool
    attach_function 'GetComputerObjectNameW', [ExtendedNameFormat ,:pointer, :pointer], :bool

    #BOOLEAN WINAPI GetUserNameEx(
    #  _In_     EXTENDED_NAME_FORMAT NameFormat,
    #  _Out_    LPTSTR lpNameBuffer,
    #  _Inout_  PULONG lpnSize )
    attach_function 'GetUserNameExA', [ExtendedNameFormat, :pointer, :pointer], :bool
    attach_function 'GetUserNameExW', [ExtendedNameFormat, :pointer, :pointer], :bool

    #BOOLEAN WINAPI TranslateName(
    #  _In_     LPCTSTR lpAccountName,
    #  _In_     EXTENDED_NAME_FORMAT AccountNameFormat,
    #  _In_     EXTENDED_NAME_FORMAT DesiredNameFormat,
    #  _Out_    LPTSTR lpTranslatedName,
    #  _Inout_  PULONG nSize )
    attach_function 'TranslateNameA', [:string, ExtendedNameFormat, ExtendedNameFormat, :string, :pointer], :bool
    attach_function 'TranslateNameW', [:string, ExtendedNameFormat, ExtendedNameFormat, :string, :pointer], :bool
  end
end