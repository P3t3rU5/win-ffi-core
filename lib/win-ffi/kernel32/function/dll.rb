require 'win-ffi/kernel32'
require 'win-ffi/kernel32/enum/get_module_handle_ex_flag'

module WinFFI
  module Kernel32
    #BOOL WINAPI DisableThreadLibraryCalls( _In_  HMODULE hModule )
    attach_function 'DisableThreadLibraryCalls', [:hmodule], :bool

    #BOOL WINAPI DllMain(
    #  _In_  HINSTANCE hinstDLL,
    #  _In_  DWORD fdwReason,
    #  _In_  LPVOID lpvReserved )
    #attach_function 'DllMain', [:hinstance, :dword, :pointer], :bool

    #BOOL WINAPI FreeLibrary( _In_  HMODULE hModule )
    attach_function 'FreeLibrary', [:hmodule], :bool

    #VOID WINAPI FreeLibraryAndExitThread(
    #  _In_  HMODULE hModule,
    #  _In_  DWORD dwExitCode )
    attach_function 'FreeLibraryAndExitThread', [:hmodule, :dword], :void

    #DWORD WINAPI GetModuleFileName(
    #  _In_opt_  HMODULE hModule,
    #  _Out_     LPTSTR lpFilename,
    #  _In_      DWORD nSize )
    encoded_function 'GetModuleFileName', [:hmodule, :string, :dword], :dword

    #HMODULE WINAPI GetModuleHandle( _In_opt_  LPCTSTR lpModuleName )
    encoded_function 'GetModuleHandle', [:string], :hmodule

    #BOOL GetModuleHandleEx(
    #  __in      DWORD dwFlags,
    #  __in_opt  LPCTSTR lpModuleName,
    #  __out     HMODULE *phModule)
    encoded_function 'GetModuleHandleEx', [GetModuleHandleExFlag, :string, :pointer], :bool

    #FARPROC WINAPI GetProcAddress(
    #  _In_  HMODULE hModule,
    #  _In_  LPCSTR lpProcName )
    attach_function 'GetProcAddress', [:hmodule, :string], :pointer

    #HMODULE WINAPI LoadLibrary( _In_  LPCTSTR lpFileName )
    encoded_function 'LoadLibrary', [:string], :hmodule

    #HMODULE WINAPI LoadLibraryEx(
    #  _In_        LPCTSTR lpFileName,
    #  _Reserved_  HANDLE hFile,
    #  _In_        DWORD dwFlags )
    encoded_function 'LoadLibraryEx', [:string, :handle, :dword], :hmodule

    #DWORD WINAPI LoadModule(
    #  _In_  LPCSTR lpModuleName,
    #  _In_  LPVOID lpParameterBlock )
    attach_function 'LoadModule', [:string, :pointer], :dword

    if WindowsVersion.sp >= 1 || WindowsVersion >= :vista

      #DWORD WINAPI GetDllDirectory(
      #  _In_   DWORD nBufferLength,
      #  _Out_  LPTSTR lpBuffer )
      encoded_function 'GetDllDirectory', [:dword, :pointer], :dword

      #BOOL WINAPI SetDllDirectory( _In_opt_  LPCTSTR lpPathName )
      encoded_function 'SetDllDirectory', [:string], :bool

      if WindowsVersion >= 8

        #DLL_DIRECTORY_COOKIE  WINAPI AddDllDirectory( _In_  PCWSTR NewDirectory )
        attach_function 'AddDllDirectory', [:pointer], :pointer

        #HMODULE WINAPI LoadPackagedLibrary(
        #  _In_        LPCWSTR lpwLibFileName,
        #  _Reserved_  DWORD Reserved )
        attach_function 'LoadPackagedLibrary', [:string, :dword], :hmodule

        #BOOL  WINAPI RemoveDllDirectory( _In_  DLL_DIRECTORY_COOKIE Cookie )
        attach_function 'RemoveDllDirectory', [:pointer], :bool

        #BOOL  WINAPI SetDefaultDllDirectories( _In_  DWORD DirectoryFlags )
        attach_function 'SetDefaultDllDirectories', [:dword], :bool
      end
    end
  end
end