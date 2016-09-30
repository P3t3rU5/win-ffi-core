module WinFFI
  class SECURITY_ATTRIBUTES < FFIAdditions::Struct
    layout nLength:                :dword,
           lpSecurityDescriptor: :pointer,
           bInheritHandle:          :bool
  end
end