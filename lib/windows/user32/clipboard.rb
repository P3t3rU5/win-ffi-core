module WinFFI
  module User32
    module Clipboard
      extend LibBase
      ffi_lib 'user32'

      ClipboardFormats = enum :clipboard_formats, [
          :TEXT,            1,
          :BITMAP,          2,
          :METAFILEPICT,    3,
          :SYLK,            4,
          :DIF,             5,
          :TIFF,            6,
          :OEMTEXT,         7,
          :DIB,             8,
          :PALETTE,         9,
          :PENDATA,         10,
          :RIFF,            11,
          :WAVE,            12,
          :UNICODETEXT,     13,
          :ENHMETAFILE,     14,
          :HDROP,           15,
          :LOCALE,          16,
          :MAX,             18, # Assume Windows 2000 or later
          :OWNERDISPLAY,    0x0080,
          :DSPTEXT,         0x0081,
          :DSPBITMAP,       0x0082,
          :DSPMETAFILEPICT, 0x0083,
          :DSPENHMETAFILE,  0x008E
      ]

      class METAFILEPICT < FFI::Struct
        layout :mm,   :long,
               :xExt, :long,
               :yExt, :long,
               :hMF,  :hmetafile
      end

      #BOOL WINAPI ChangeClipboardChain(
      #  _In_  HWND hWndRemove,
      #  _In_  HWND hWndNewNext )
      attach_function 'ChangeClipboardChain', [:hwnd, :hwnd], :bool

      #BOOL WINAPI CloseClipboard(void)
      attach_function 'CloseClipboard', [], :bool

      #int WINAPI CountClipboardFormats(void)
      attach_function 'CountClipboardFormats', [], :int

      #BOOL WINAPI EmptyClipboard(void)
      attach_function 'EmptyClipboard', [:bool], :void

      #UINT WINAPI EnumClipboardFormats( _In_  UINT format )
      attach_function 'EnumClipboardFormats', [:uint], :uint

      #HANDLE WINAPI GetClipboardData( _In_  UINT uFormat )
      attach_function 'GetClipboardData', [:uint], :handle

      #int WINAPI GetClipboardFormatName(
      #  _In_   UINT format,
      #  _Out_  LPTSTR lpszFormatName,
      #  _In_   int cchMaxCount )
      attach_function 'GetClipboardFormatNameA', [:uint, :string, :int], :int
      attach_function 'GetClipboardFormatNameW', [:uint, :string, :int], :int

      #HWND WINAPI GetClipboardOwner(void)
      attach_function 'GetClipboardOwner',[], :hwnd

      #DWORD WINAPI GetClipboardSequenceNumber(void)
      attach_function 'GetClipboardSequenceNumber', [], :dword

      #HWND WINAPI GetClipboardViewer(void)
      attach_function 'GetClipboardViewer', [], :hwnd

      #HWND WINAPI GetOpenClipboardWindow(void)
      attach_function 'GetOpenClipboardWindow', [], :hwnd

      #int WINAPI GetPriorityClipboardFormat(
      #  _In_  UINT *paFormatPriorityList,
      #  _In_  int cFormats )
      attach_function 'GetPriorityClipboardFormat', [ClipboardFormats, :int], :int

      #BOOL WINAPI IsClipboardFormatAvailable( _In_  UINT format )
      attach_function 'IsClipboardFormatAvailable', [:uint], :bool

      #BOOL WINAPI OpenClipboard( _In_opt_  HWND hWndNewOwner )
      attach_function 'OpenClipboard', [:hwnd], :bool

      #UINT WINAPI RegisterClipboardFormat( _In_  LPCTSTR lpszFormat )
      attach_function 'RegisterClipboardFormatA', [:string], :uint
      attach_function 'RegisterClipboardFormatW', [:string], :uint

      #HANDLE WINAPI SetClipboardData(
      #  _In_      UINT uFormat,
      #  _In_opt_  HANDLE hMem )
      attach_function 'SetClipboardData', [:uint, :handle], :handle

      #HWND WINAPI SetClipboardViewer( _In_  HWND hWndNewViewer )
      attach_function 'SetClipboardViewer', [:hwnd], :hwnd

      if WindowsVersion >= :vista
        #BOOL WINAPI AddClipboardFormatListener( _In_  HWND hwnd )
        attach_function 'AddClipboardFormatListener', [:hwnd], :bool

        #BOOL WINAPI GetUpdatedClipboardFormats(
        #  _Out_  PUINT lpuiFormats,
        #  _In_   UINT cFormats,
        #  _Out_  PUINT pcFormatsOut )
        attach_function 'GetUpdatedClipboardFormats', [:pointer, :uint, :pointer], :bool

        #BOOL WINAPI RemoveClipboardFormatListener( _In_  HWND hwnd )
        attach_function 'RemoveClipboardFormatListener', [:hwnd], :bool
      end
    end
  end
end