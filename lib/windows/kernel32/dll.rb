module WinFFI
  module Kernel32
    module DLL
      extend LibBase
      ffi_lib 'kernel32'

      GetModuleHandleExFlag = enum :get_module_handle_ex_flag, [:none, :pin, :unchanged_refcount, :from_address]

      #DLL_DIRECTORY_COOKIE  WINAPI AddDllDirectory( _In_  PCWSTR NewDirectory )
      attach_function 'AddDllDirectory', [:pointer], :pointer

      #BOOL WINAPI DisableThreadLibraryCalls( _In_  HMODULE hModule )
      attach_function 'DisableThreadLibraryCalls', [:hmodule], :bool

      #BOOL WINAPI DllMain(
      #  _In_  HINSTANCE hinstDLL,
      #  _In_  DWORD fdwReason,
      #  _In_  LPVOID lpvReserved )
      #attach_function 'DllMain', [:hinstance, :dword, :pointer], :bool

      #BOOL WINAPI FreeLibrary( _In_  HMODULE hModule )
      attach_function 'FreeLibrary', [:hmodule]

      #VOID WINAPI FreeLibraryAndExitThread(
      #  _In_  HMODULE hModule,
      #  _In_  DWORD dwExitCode )
      attach_function 'FreeLibraryAndExitThread', [:hmodule, :dword], :void

      #DWORD WINAPI GetDllDirectory(
      #  _In_   DWORD nBufferLength,
      #  _Out_  LPTSTR lpBuffer )
      attach_function 'GetDllDirectoryA', [:dword, :pointer]

      #BOOL GetModuleHandleEx(
      #  __in      DWORD dwFlags,
      #  __in_opt  LPCTSTR lpModuleName,
      #  __out     HMODULE *phModule)
      attach_function 'GetModuleHandleEx', [GetModuleHandleExFlag, :string, :pointer], :bool
      attach_function 'GetModuleHandleExA', [GetModuleHandleExFlag, :string, :pointer], :bool
      attach_function 'GetModuleHandleExW', [GetModuleHandleExFlag, :string, :pointer], :bool

      def self.module_handle(flags = :none, module_name = nil)
        hinstance = nil
        FFI::MemoryPointer.new(:pointer, 1) do |p|
          if GetModuleHandleEx(flags, module_name, p)
            hinstance = p.read_pointer
            hinstance = nil if hinstance.null?
          end
        end
        hinstance
      end
    end
  end
end