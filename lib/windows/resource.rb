module WinFFI
  module Resource
    extend LibBase

    typedef :ushort, :langid
    typedef :pointer, :hrsrc

    ffi_lib 'kernel32'


    #HANDLE WINAPI BeginUpdateResource(
    #  _In_  LPCTSTR pFileName,
    #  _In_  BOOL bDeleteExistingResources )
    attach_function 'BeginUpdateResourceA', [:string, :bool], :handle
    attach_function 'BeginUpdateResourceW', [:string, :bool], :handle

    #BOOL WINAPI EndUpdateResource(
    #  _In_  HANDLE hUpdate,
    #  _In_  BOOL fDiscard )
    attach_function 'EndUpdateResourceA', [:handle, :bool], :bool
    attach_function 'EndUpdateResourceW', [:handle, :bool], :bool

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
    attach_function 'EnumResourceLanguagesA', [:hmodule, :pointer, :pointer, :pointer, :lparam], :bool
    attach_function 'EnumResourceLanguagesW', [:hmodule, :pointer, :pointer, :pointer, :lparam], :bool

    #BOOL WINAPI EnumResourceNames(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpszType,
    #  _In_      ENUMRESNAMEPROC lpEnumFunc,
    #  _In_      LONG_PTR lParam )
    attach_function 'EnumResourceNamesA', [:hmodule, :pointer, :pointer, :lparam], :bool
    attach_function 'EnumResourceNamesW', [:hmodule, :pointer, :pointer, :lparam], :bool

    #BOOL WINAPI EnumResourceTypes(
    #  _In_opt_  HMODULE hModule,
    #  _In_      ENUMRESTYPEPROC lpEnumFunc,
    #  _In_      LONG_PTR lParam )
    attach_function 'EnumResourceTypesA', [:hmodule, :pointer, :long], :bool
    attach_function 'EnumResourceTypesW', [:hmodule, :pointer, :long], :bool

    #BOOL CALLBACK EnumResTypeProc(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPTSTR lpszType,
    #  _In_      LONG_PTR lParam )
    callback 'EnumResTypeProc', [:hmodule, :string, :long], :bool

    #HRSRC WINAPI FindResource(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpName,
    #  _In_      LPCTSTR lpType )
    attach_function 'FindResourceA', [:hmodule, :pointer, :pointer], :hrsrc
    attach_function 'FindResourceW', [:hmodule, :pointer, :pointer], :hrsrc

    #HRSRC WINAPI FindResourceEx(
    #  _In_opt_  HMODULE hModule,
    #  _In_      LPCTSTR lpType,
    #  _In_      LPCTSTR lpName,
    #  _In_      WORD wLanguage )
    attach_function 'FindResourceExA', [:hmodule, :pointer, :pointer, :word], :hrsrc
    attach_function 'FindResourceExW', [:hmodule, :pointer, :pointer, :word], :hrsrc

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
    attach_function 'UpdateResourceA', [:handle, :pointer, :pointer, :word, :pointer, :dword], :bool
    attach_function 'UpdateResourceW', [:handle, :pointer, :pointer, :word, :pointer, :dword], :bool

    if WindowsVersion >= :vista

      #BOOL WINAPI EnumResourceLanguagesEx(
      #  _In_  HMODULE hModule,
      #  _In_  LPCTSTR lpType,
      #  _In_  LPCTSTR lpName,
      #  _In_  ENUMRESLANGPROC lpEnumFunc,
      #  _In_  LONG_PTR lParam,
      #  _In_  DWORD dwFlags,
      #  _In_  LANGID LangId )
      attach_function 'EnumResourceLanguagesExA', [:hmodule, :pointer, :pointer, :pointer, :long, :dword, :langid], :bool
      attach_function 'EnumResourceLanguagesExW', [:hmodule, :pointer, :pointer, :pointer, :long, :dword, :langid], :bool

      #BOOL WINAPI EnumResourceNamesEx(
      #  _In_opt_  HMODULE hModule,
      #  _In_      LPCTSTR lpszType,
      #  _In_      ENUMRESNAMEPROC lpEnumFunc,
      #  _In_      LONG_PTR lParam,
      #  _In_      DWORD dwFlags,
      #  _In_      LANGID LangId )
      attach_function 'EnumResourceNamesExA', [:hmodule, :pointer, :pointer, :lparam, :dword, :langid], :bool
      attach_function 'EnumResourceNamesExW', [:hmodule, :pointer, :pointer, :lparam, :dword, :langid], :bool

      #BOOL WINAPI EnumResourceTypesEx(
      #  _In_opt_  HMODULE hModule,
      #  _In_      ENUMRESTYPEPROC lpEnumFunc,
      #  _In_      LONG_PTR lParam,
      #  _In_      DWORD dwFlags,
      #  _In_      LANGID LangId )
      attach_function 'EnumResourceTypesExA', [:hmodule, :pointer, :long, :dword, :langid], :bool
      attach_function 'EnumResourceTypesExW', [:hmodule, :pointer, :long, :dword, :langid], :bool

    end

    ffi_lib 'user32'

    #HANDLE WINAPI CopyImage(
    #  _In_  HANDLE hImage,
    #  _In_  UINT uType,
    #  _In_  int cxDesired,
    #  _In_  int cyDesired,
    #  _In_  UINT fuFlags )
    attach_function 'CopyImage', [:handle, :uint, :int, :int, LR], :handle

    #HANDLE LoadImage(
    #  __in_opt  HINSTANCE hinst,
    #  __in      LPCTSTR   lpszName,
    #  __in      UINT      uType,
    #  __in      int       cxDesired,
    #  __in      int       cyDesired,
    #  __in      UINT      fuLoad)
    attach_function 'LoadImageA', [:hinstance, :pointer, :uint, :int, :int, :uint], :handle
    attach_function 'LoadImageW', [:hinstance, :pointer, :uint, :int, :int, :uint], :handle

  end
end