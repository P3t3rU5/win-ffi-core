require_relative '../../structs/kernel32/actctx'

module WinFFI
  module Kernel32
    extend LibBase
    if WindowsVersion >= :xp
      # BOOL ActivateActCtx(_In_   HANDLE hActCtx, _Out_  ULONG_PTR *lpCookie)
      attach_function 'ActivateActCtx', [:hwnd, :pointer], :bool

      # BOOL DeactivateActCtx(_In_  DWORD dwFlags, _In_  ULONG_PTR ulCookie)
      attach_function 'DeactivateActCtx', [:dword, :pointer], :bool

      # void AddRefActCtx(_In_  HANDLE hActCtx)
      attach_function 'AddRefActCtx', [ACTCTX.by_ref], :void

      # HANDLE CreateActCtx(_Inout_  PACTCTX pActCtx)
      attach_function 'CreateActCtxA', [ACTCTX.by_ref], :handle
      attach_function 'CreateActCtxW', [ACTCTX.by_ref], :handle
    end
  end
end