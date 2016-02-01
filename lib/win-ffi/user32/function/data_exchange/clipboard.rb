require 'win-ffi/user32'

require 'win-ffi/user32/enum/data_exchange/clipboard_formats'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649034(v=vs.85).aspx
    # BOOL WINAPI ChangeClipboardChain(
    #   _In_  HWND hWndRemove,
    #   _In_  HWND hWndNewNext )
    attach_function 'ChangeClipboardChain', [:hwnd, :hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649035(v=vs.85).aspx
    # BOOL WINAPI CloseClipboard(void)
    attach_function 'CloseClipboard', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649036(v=vs.85).aspx
    # int WINAPI CountClipboardFormats(void)
    attach_function 'CountClipboardFormats', [], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649037(v=vs.85).aspx
    # BOOL WINAPI EmptyClipboard(void)
    attach_function 'EmptyClipboard', [:bool], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649038(v=vs.85).aspx
    # UINT WINAPI EnumClipboardFormats( _In_  UINT format )
    attach_function 'EnumClipboardFormats', [:uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649039(v=vs.85).aspx
    # HANDLE WINAPI GetClipboardData( _In_  UINT uFormat )
    attach_function 'GetClipboardData', [:uint], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649040(v=vs.85).aspx
    # int WINAPI GetClipboardFormatName(
    #   _In_   UINT format,
    #   _Out_  LPTSTR lpszFormatName,
    #   _In_   int cchMaxCount )
    encoded_function 'GetClipboardFormatName', [:uint, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649041(v=vs.85).aspx
    # HWND WINAPI GetClipboardOwner(void)
    attach_function 'GetClipboardOwner',[], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649042(v=vs.85).aspx
    # DWORD WINAPI GetClipboardSequenceNumber(void)
    attach_function 'GetClipboardSequenceNumber', [], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649043(v=vs.85).aspx
    # HWND WINAPI GetClipboardViewer(void)
    attach_function 'GetClipboardViewer', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649044(v=vs.85).aspx
    # HWND WINAPI GetOpenClipboardWindow(void)
    attach_function 'GetOpenClipboardWindow', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649045(v=vs.85).aspx
    # int WINAPI GetPriorityClipboardFormat(
    #   _In_  UINT *paFormatPriorityList,
    #   _In_  int cFormats )
    attach_function 'GetPriorityClipboardFormat', [ClipboardFormats, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649047(v=vs.85).aspx
    # BOOL WINAPI IsClipboardFormatAvailable( _In_  UINT format )
    attach_function 'IsClipboardFormatAvailable', [:uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649048(v=vs.85).aspx
    # BOOL WINAPI OpenClipboard( _In_opt_  HWND hWndNewOwner )
    attach_function 'OpenClipboard', [:hwnd], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649049(v=vs.85).aspx
    # UINT WINAPI RegisterClipboardFormat( _In_  LPCTSTR lpszFormat )
    encoded_function 'RegisterClipboardFormat', [:string], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649051(v=vs.85).aspx
    # HANDLE WINAPI SetClipboardData(
    #   _In_      UINT uFormat,
    #   _In_opt_  HANDLE hMem )
    attach_function 'SetClipboardData', [:uint, :handle], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649052(v=vs.85).aspx
    # HWND WINAPI SetClipboardViewer( _In_  HWND hWndNewViewer )
    attach_function 'SetClipboardViewer', [:hwnd], :hwnd

    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649033(v=vs.85).aspx
      # BOOL WINAPI AddClipboardFormatListener( _In_  HWND hwnd )
      attach_function 'AddClipboardFormatListener', [:hwnd], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649046(v=vs.85).aspx
      # BOOL WINAPI GetUpdatedClipboardFormats(
      #   _Out_  PUINT lpuiFormats,
      #   _In_   UINT cFormats,
      #   _Out_  PUINT pcFormatsOut )
      attach_function 'GetUpdatedClipboardFormats', [:pointer, :uint, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649050(v=vs.85).aspx
      # BOOL WINAPI RemoveClipboardFormatListener( _In_  HWND hwnd )
      attach_function 'RemoveClipboardFormatListener', [:hwnd], :bool
    end
  end
end