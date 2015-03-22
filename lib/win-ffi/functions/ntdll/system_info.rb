module WinFFI
  module Ntdll
    extend LibBase

    ffi_lib 'Ntdll'

    #NTSTATUS WINAPI NtQuerySystemInformation(
    #  _In_       SYSTEM_INFORMATION_CLASS SystemInformationClass,
    #  _Inout_    PVOID SystemInformation,
    #  _In_       ULONG SystemInformationLength,
    #  _Out_opt_  PULONG ReturnLength )
    attach_function 'NtQuerySystemInformation', [:pointer, :pointer, :ulong, :pointer], :int
  end
end