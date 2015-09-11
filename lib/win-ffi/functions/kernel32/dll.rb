require 'win-ffi/functions/kernel32'
require 'win-ffi/enums/kernel32/get_module_handle_ex_flag'

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
    attach_function 'GetModuleFileNameA', [:hmodule, :string, :dword], :dword
    attach_function 'GetModuleFileNameW', [:hmodule, :string, :dword], :dword

    #HMODULE WINAPI GetModuleHandle( _In_opt_  LPCTSTR lpModuleName )
    attach_function 'GetModuleHandleA', [:string], :hmodule
    attach_function 'GetModuleHandleW', [:string], :hmodule

    #BOOL GetModuleHandleEx(
    #  __in      DWORD dwFlags,
    #  __in_opt  LPCTSTR lpModuleName,
    #  __out     HMODULE *phModule)
    attach_function 'GetModuleHandleExA', [GetModuleHandleExFlag, :string, :pointer], :bool
    attach_function 'GetModuleHandleExW', [GetModuleHandleExFlag, :string, :pointer], :bool

    #FARPROC WINAPI GetProcAddress(
    #  _In_  HMODULE hModule,
    #  _In_  LPCSTR lpProcName )
    attach_function 'GetProcAddress', [:hmodule, :string], :pointer

    #HMODULE WINAPI LoadLibrary( _In_  LPCTSTR lpFileName )
    attach_function 'LoadLibraryA', [:string], :hmodule
    attach_function 'LoadLibraryW', [:string], :hmodule

    #HMODULE WINAPI LoadLibraryEx(
    #  _In_        LPCTSTR lpFileName,
    #  _Reserved_  HANDLE hFile,
    #  _In_        DWORD dwFlags )
    attach_function 'LoadLibraryExA', [:string, :handle, :dword], :hmodule
    attach_function 'LoadLibraryExW', [:string, :handle, :dword], :hmodule

    #DWORD WINAPI LoadModule(
    #  _In_  LPCSTR lpModuleName,
    #  _In_  LPVOID lpParameterBlock )
    attach_function 'LoadModule', [:string, :pointer], :dword

    if WindowsVersion.sp >= 1 || WindowsVersion >= :vista

      #DWORD WINAPI GetDllDirectory(
      #  _In_   DWORD nBufferLength,
      #  _Out_  LPTSTR lpBuffer )
      attach_function 'GetDllDirectoryA', [:dword, :pointer], :dword
      attach_function 'GetDllDirectoryW', [:dword, :pointer], :dword

      #BOOL WINAPI SetDllDirectory( _In_opt_  LPCTSTR lpPathName )
      attach_function 'SetDllDirectoryA', [:string], :bool
      attach_function 'SetDllDirectoryW', [:string], :bool

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