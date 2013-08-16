module WinFFI
  module Gdi32
    module MetaFile
      extend LibBase
      ffi_lib 'gdi32'

      typedef :pointer, :henhmetafile

      class HANDLETABLE < FFI::Struct
        layout :objectHandle, :pointer
      end

      class METAFILEPICT < FFI::Struct
        layout :mm,   :long,
               :xExt, :long,
               :yExt, :long,
               :hMf,  :long
      end

      #HENHMETAFILE CloseEnhMetaFile( _In_  HDC hdc )
      attach_function 'CloseEnhMetaFile', [:hdc], :henhmetafile

      #HMETAFILE CloseMetaFile( _In_  HDC hdc )
      attach_function 'CloseMetaFile', [:hdc], :hmetafile

      #HENHMETAFILE CopyEnhMetaFile(
      #  _In_  HENHMETAFILE hemfSrc,
      #  _In_  LPCTSTR lpszFile )
      attach_function 'CopyEnhMetaFileA', [:henhmetafile, :string], :henhmetafile
      attach_function 'CopyEnhMetaFileW', [:henhmetafile, :string], :henhmetafile

      #HMETAFILE CopyMetaFile(
      #  _In_  HMETAFILE hmfSrc,
      #  _In_  LPCTSTR lpszFile )
      attach_function 'CopyMetaFileA', [:hmetafile, :string], :hmetafile
      attach_function 'CopyMetaFileW', [:hmetafile, :string], :hmetafile

      #HDC CreateEnhMetaFile(
      #  _In_  HDC hdcRef,
      #  _In_  LPCTSTR lpFilename,
      #  _In_  const RECT *lpRect,
      #  _In_  LPCTSTR lpDescription )
      attach_function 'CreateEnhMetaFileA', [:hdc, :string, RECT.ptr, :string], :hdc
      attach_function 'CreateEnhMetaFileW', [:hdc, :string, RECT.ptr, :string], :hdc

      #HDC CreateMetaFile( _In_  LPCTSTR lpszFile )
      attach_function 'CreateMetaFileA', [:string], :hdc
      attach_function 'CreateMetaFileW', [:string], :hdc

      #BOOL DeleteEnhMetaFile( _In_  HENHMETAFILE hemf )
      attach_function 'DeleteEnhMetaFile', [:henhmetafile], :bool

      #BOOL DeleteMetaFile( _In_  HMETAFILE hmf )
      attach_function 'DeleteMetaFile', [:hmetafile], :bool

      #TODO
      #int CALLBACK EnhMetaFileProc(
      #  _In_  HDC hDC,
      #  _In_  HANDLETABLE *lpHTable,
      #  _In_  const ENHMETARECORD *lpEMFR,
      #  _In_  int nObj,
      #  _In_  LPARAM lpData )
      callback 'EnhMetaFileProc', [:hdc, HANDLETABLE, :pointer, :int, :lparam], :int

      #BOOL EnumEnhMetaFile(
      #  _In_  HDC hdc,
      #  _In_  HENHMETAFILE hemf,
      #  _In_  ENHMFENUMPROC lpEnhMetaFunc,
      #  _In_  LPVOID lpData,
      #  _In_  const RECT *lpRect )
      attach_function 'EnumEnhMetaFile', [:hdc, :henhmetafile, :pointer, :pointer, RECT.ptr], :bool

      #BOOL EnumMetaFile(
      #  _In_  HDC hdc,
      #  _In_  HMETAFILE hmf,
      #  _In_  MFENUMPROC lpMetaFunc,
      #  _In_  LPARAM lParam )
      attach_function 'EnumMetaFile', [:hdc, :hmetafile, :pointer, :lparam], :bool

      #TODO
      #int CALLBACK EnumMetaFileProc(
      #  _In_  HDC hDC,
      #  _In_  HANDLETABLE *lpHTable,
      #  _In_  METARECORD *lpMFR,
      #  _In_  int nObj,
      #  _In_  LPARAM lpClientData )
      callback 'EnumMetaFileProc', [:hdc, HANDLETABLE, :pointer, :int, :lparam], :int

      #BOOL GdiComment(
      #  _In_  HDC hdc,
      #  _In_  UINT cbSize,
      #  _In_  const BYTE *lpData )
      attach_function 'GdiComment', [:hdc, :uint, :pointer], :bool

      #HENHMETAFILE GetEnhMetaFile( _In_  LPCTSTR lpszMetaFile )
      attach_function 'GetEnhMetaFileA', [:string], :henhmetafile
      attach_function 'GetEnhMetaFileW', [:string], :henhmetafile

      #UINT GetEnhMetaFileBits(
      #  _In_   HENHMETAFILE hemf,
      #  _In_   UINT cbBuffer,
      #  _Out_  LPBYTE lpbBuffer )
      attach_function 'GetEnhMetaFileBits', [:henhmetafile, :uint, :pointer], :uint

      #UINT GetEnhMetaFileDescription(
      #  _In_   HENHMETAFILE hemf,
      #  _In_   UINT cchBuffer,
      #  _Out_  LPTSTR lpszDescription )
      attach_function 'GetEnhMetaFileDescriptionA', [:henhmetafile, :uint, :string], :uint
      attach_function 'GetEnhMetaFileDescriptionW', [:henhmetafile, :uint, :string], :uint

      #TODO ENHMETAHEADER struct
      #UINT GetEnhMetaFileHeader(
      #  _In_   HENHMETAFILE hemf,
      #  _In_   UINT cbBuffer,
      #  _Out_  LPENHMETAHEADER lpemh )
      attach_function 'GetEnhMetaFileHeader', [:henhmetafile, :uint, :pointer], :uint

      #UINT GetEnhMetaFilePaletteEntries(
      #  _In_   HENHMETAFILE hemf,
      #  _In_   UINT cEntries,
      #  _Out_  LPPALETTEENTRY lppe )
      attach_function 'GetEnhMetaFilePaletteEntries', [:henhmetafile, :uint, PALETTEENTRY.ptr], :uint

      #UINT GetMetaFileBitsEx(
      #  _In_   HMETAFILE hmf,
      #  _In_   UINT nSize,
      #  _Out_  LPVOID lpvData )
      attach_function 'GetMetaFileBitsEx', [:hmetafile, :uint, :pointer], :uint

      #UINT GetWinMetaFileBits(
      #  _In_   HENHMETAFILE hemf,
      #  _In_   UINT cbBuffer,
      #  _Out_  LPBYTE lpbBuffer,
      #  _In_   INT fnMapMode,
      #  _In_   HDC hdcRef )
      attach_function 'GetWinMetaFileBits', [:henhmetafile, :uint, :pointer, :int, :hdc], :uint

      #BOOL PlayEnhMetaFile(
      #  _In_  HDC hdc,
      #  _In_  HENHMETAFILE hemf,
      #  _In_  const RECT *lpRect )
      attach_function 'PlayEnhMetaFile', [:hdc, :henhmetafile, RECT.ptr], :bool

      #BOOL PlayEnhMetaFileRecord(
      #  _In_  HDC hdc,
      #  _In_  LPHANDLETABLE lpHandletable,
      #  _In_  const ENHMETARECORD *lpEnhMetaRecord,
      #  _In_  UINT nHandles )
      attach_function 'PlayEnhMetaFileRecord', [:hdc, :pointer, :pointer, :uint], :bool

      #BOOL PlayMetaFile(
      #  _In_  HDC hdc,
      #  _In_  HMETAFILE hmf )
      attach_function 'PlayMetaFile', [:hdc, :hmetafile], :bool

      #BOOL PlayMetaFileRecord(
      #  _In_  HDC hdc,
      #  _In_  LPHANDLETABLE lpHandletable,
      #  _In_  LPMETARECORD lpMetaRecord,
      #  _In_  UINT nHandles )
      attach_function 'PlayMetaFileRecord', [:hdc, HANDLETABLE.ptr, :pointer, :uint], :bool

      #HENHMETAFILE SetEnhMetaFileBits(
      #  _In_  UINT cbBuffer,
      #  _In_  const BYTE *lpData )
      attach_function 'SetEnhMetaFileBits', [:uint, :pointer], :henhmetafile

      #HMETAFILE SetMetaFileBitsEx(
      #  _In_  UINT nSize,
      #  _In_  const BYTE *lpData )
      attach_function 'SetMetaFileBitsEx', [:uint, :pointer], :hmetafile

      #HENHMETAFILE SetWinMetaFileBits(
      #  _In_  UINT cbBuffer,
      #  _In_  const BYTE *lpbBuffer,
      #  _In_  HDC hdcRef,
      #  _In_  const METAFILEPICT *lpmfp )
      attach_function 'SetWinMetaFileBits', [:uint, :pointer, :hdc, METAFILEPICT.ptr], :henhmetafile
    end
  end
end