module WinFFI
  class SECURITY_ATTRIBUTES < FFIStruct
    layout :nLength,              :dword,
           :lpSecurityDescriptor, :pointer,
           :bInheritHandle,       :bool
  end
end