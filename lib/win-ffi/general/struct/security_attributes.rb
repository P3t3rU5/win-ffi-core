module WinFFI
  class SECURITY_ATTRIBUTES < FFIStruct
    layout :nLength,              :dword,
           :lpSecurityDescriptor, :lpvoid,
           :bInheritHandle,       :bool
  end
end