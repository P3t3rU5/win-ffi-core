require 'win-ffi/kernel32'

module WinFFI
  module Kernel32

    typedef :ushort, :langid
    typedef :pointer, :hrsrc

    #HANDLE WINAPI BeginUpdateResource(
    #  _In_  LPCTSTR pFileName,
    #  _In_  BOOL bDeleteExistingResources )
    encoded_function 'BeginUpdateResource', [:string, :bool], :handle

    #BOOL WINAPI EndUpdateResource(
    #  _In_  HANDLE hUpdate,
    #  _In_  BOOL fDiscard )
    encoded_function 'EndUpdateResource', [:handle, :bool], :bool

    #BOOL CALLBACK EnumResLangProc(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpszType,
    #  _In_      LPCTSTR lpszName,
    #  _In_      WORD wIDLanguage,
    #  _In_      LONG_PTR lParam )
    callback 'EnumResLangProc', [:hmodule, :string, :string, :word, :long], :bool

    #BOOL CALLBACK EnumResNameProc(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpszType,
    #  _In_      LPTSTR lpszName,
    #  _In_      LONG_PTR lParam )
    callback 'EnumResNameProc', [:hmodule, :pointer, :pointer, :long], :bool

    #BOOL WINAPI EnumResourceLanguages(
    #  _In_  HMODULE hModule,
    #  _In_  LPCTSTR lpType,
    #  _In_  LPCTSTR lpName,
    #  _In_  ENUMRESLANGPROC lpEnumFunc,
    #  _In_  LONG_PTR lParam )
    encoded_function 'EnumResourceLanguages', [:hmodule, :pointer, :pointer, :pointer, :lparam], :bool

    #BOOL WINAPI EnumResourceNames(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpszType,
    #  _In_      ENUMRESNAMEPROC lpEnumFunc,
    #  _In_      LONG_PTR lParam )
    encoded_function 'EnumResourceNames', [:hmodule, :pointer, :pointer, :lparam], :bool

    #BOOL WINAPI EnumResourceTypes(
    #  _In_opt_  HMODULE hModule,
    #  _In_      ENUMRESTYPEPROC lpEnumFunc,
    #  _In_      LONG_PTR lParam )
    encoded_function 'EnumResourceTypes', [:hmodule, :pointer, :long], :bool

    #BOOL CALLBACK EnumResTypeProc(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPTSTR lpszType,
    #  _In_      LONG_PTR lParam )
    callback 'EnumResTypeProc', [:hmodule, :string, :long], :bool

    #HRSRC WINAPI FindResource(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpName,
    #  _In_      LPCTSTR lpType )
    encoded_function 'FindResource', [:hmodule, :pointer, :pointer], :hrsrc

    #HRSRC WINAPI FindResourceEx(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpType,
    #  _In_      LPCTSTR lpName,
    #  _In_      WORD wLanguage )
    encoded_function 'FindResourceEx', [:hmodule, :pointer, :pointer, :word], :hrsrc

    #BOOL WINAPI FreeResource( _In_  HGLOBAL hglbResource )
    attach_function 'FreeResource', [:hglobal], :bool

    #HGLOBAL WINAPI LoadResource(
    #  _In_opt_  HMODULE hModule,
    #  _In_      HRSRC hResInfo )
    attach_function 'LoadResource', [:hmodule, :hrsrc], :hglobal

    #LPVOID WINAPI LockResource( _In_  HGLOBAL hResData )
    attach_function 'LockResource', [:hglobal], :pointer

    #DWORD WINAPI SizeofResource(
    #  _In_opt_  HMODULE hModule,
    #  _In_      HRSRC hResInfo )
    attach_function 'SizeofResource', [:dword, :hmodule, :hrsrc], :dword

    #BOOL WINAPI UpdateResource(
    #  _In_      HANDLE hUpdate,
    #  _In_      LPCTSTR lpType,
    #  _In_      LPCTSTR lpName,
    #  _In_      WORD wLanguage,
    #  _In_opt_  LPVOID lpData,
    #  _In_      DWORD cbData )
    encoded_function 'UpdateResource', [:handle, :pointer, :pointer, :word, :pointer, :dword], :bool

    if WindowsVersion >= :vista

      #BOOL WINAPI EnumResourceLanguagesEx(
      #  _In_  HMODULE hModule,
      #  _In_  LPCTSTR lpType,
      #  _In_  LPCTSTR lpName,
      #  _In_  ENUMRESLANGPROC lpEnumFunc,
      #  _In_  LONG_PTR lParam,
      #  _In_  DWORD dwFlags,
      #  _In_  LANGID LangId )
      encoded_function 'EnumResourceLanguagesEx', [:hmodule, :pointer, :pointer, :pointer, :long, :dword, :langid], :bool

      #BOOL WINAPI EnumResourceNamesEx(
      #  _In_opt_  HMODULE hModule,
      #  _In_      LPCTSTR lpszType,
      #  _In_      ENUMRESNAMEPROC lpEnumFunc,
      #  _In_      LONG_PTR lParam,
      #  _In_      DWORD dwFlags,
      #  _In_      LANGID LangId )
      encoded_function 'EnumResourceNamesEx', [:hmodule, :pointer, :pointer, :lparam, :dword, :langid], :bool

      #BOOL WINAPI EnumResourceTypesEx(
      #  _In_opt_  HMODULE hModule,
      #  _In_      ENUMRESTYPEPROC lpEnumFunc,
      #  _In_      LONG_PTR lParam,
      #  _In_      DWORD dwFlags,
      #  _In_      LANGID LangId )
      encoded_function 'EnumResourceTypesEx', [:hmodule, :pointer, :long, :dword, :langid], :bool

    end
  end
end