module WinFFI
  module User32
    module Window
      module WindowClass
        extend LibBase

        ffi_lib 'user32'

        #User32::ClassLong
        # Class Field Offsets
        ClassLong = enum :class_long, [
            :MENUNAME,       -8, #Replaces the address of the menu name string. The string identifies the menu resource
            # associated with the class.

            :HBRBACKGROUND, -10, #Replaces a handle to the background brush associated with the class.

            :HCURSOR,       -12, #Replaces a handle to the cursor associated with the class.

            :HICON,         -14, #Replaces a handle to the icon associated with the class.

            :HMODULE,       -16, #Replaces a handle to the module that registered the class.

            :CBWNDEXTRA,    -18, #Sets the size, in bytes, of the extra window memory associated with each window in the
            # class. Setting this value does not change the number of extra bytes already allocated. For information on
            # how to access this memory, see SetWindowLong.

            :CBCLSEXTRA,    -20, #Sets the size, in bytes, of the extra memory associated with the class. Setting this
            # value does not change  the number of extra bytes already allocated.

            :WNDPROC,       -24, #Replaces the address of the window procedure associated with the class.

            :STYLE,         -26, #Replaces the window-class style bits.

            :HICONSM,       -34, #Replace a handle to the small icon associated with the class.
        ]

        #User32::WindowLong
        WindowLong = enum :window_long, [
            :WNDPROC,    -4,  #Sets a new address for the window procedure. You cannot change this attribute if the
            # window does not belong to the same process as the calling thread.

            :HINSTANCE,  -6, #Sets a new application instance handle.

            :ID,        -12, #Sets a new identifier of the child window. The window cannot be a top-level window.

            :STYLE,     -16, #Sets a new window style.

            :EXSTYLE,   -20, #Sets a new extended window style.

            :USERDATA,  -21, #Sets the user data associated with the window. This data is intended for use by the
                             # application that created the window. Its value is initially zero.
        ]

        class WNDCLASS < FFI::Struct
          layout :style,         :uint,
                 :lpfnWndProc,   User32::Window::WindowProc::WindowProc,
                 :cbClsExtra,    :int,
                 :cbWndExtra,    :int,
                 :hInstance,     :hinstance,
                 :hIcon,         :hicon,
                 :hCursor,       :hcursor,
                 :hbrBackground, :hbrush,
                 :lpszMenuName,  :pointer,
                 :lpszClassName, :pointer,
                 :hIconSm,       :pointer

        end

        class WNDCLASSEX < FFI::Struct
          layout :cbSize,        :uint,
                 :style,         :uint,
                 :lpfnWndProc,   User32::Window::WindowProc::WindowProc,
                 :cbClsExtra,    :int,
                 :cbWndExtra,    :int,
                 :hInstance,     :hinstance,
                 :hIcon,         :hicon,
                 :hCursor,       :hcursor,
                 :hbrBackground, :hbrush,
                 :lpszMenuName,  :pointer,
                 :lpszClassName, :pointer,
                 :hIconSm,       :pointer

          #TODO
          #undef_method :cbSize=

          def initialize(class_name)
            super()
            @class_name = class_name
            self[:cbSize] = self.size
            self.lpszClassName = FFI::MemoryPointer.from_string(@class_name)
            @atom = nil
          end

          def atom
            @atom = WindowClass::RegisterClassExW(self) unless @atom
            raise "RegisterClassEx Error" if @atom == 0
            @atom
          end
        end

        #BOOL WINAPI GetClassInfo(
        #  _In_opt_  HINSTANCE hInstance,
        #  _In_      LPCTSTR lpClassName,
        #  _Out_     LPWNDCLASS lpWndClass )
        attach_function 'GetClassInfoA', [:hinstance, :pointer, WNDCLASS.ptr], :bool
        attach_function 'GetClassInfoW', [:hinstance, :pointer, WNDCLASS.ptr], :bool

        #BOOL WINAPI GetClassInfoEx(
        #  _In_opt_  HINSTANCE hinst,
        #  _In_      LPCTSTR lpszClass,
        #  _Out_     LPWNDCLASSEX lpwcx )
        attach_function 'GetClassInfoExA', [:hinstance, :pointer, WNDCLASSEX.ptr], :bool
        attach_function 'GetClassInfoExW', [:hinstance, :pointer, WNDCLASSEX.ptr], :bool

        #DWORD WINAPI GetClassLong(
        #  __in  HWND hWnd,
        #  __in  int nIndex)
        attach_function 'GetClassLongA', [:hwnd, ClassLong], :dword
        attach_function 'GetClassLongW', [:hwnd, ClassLong], :dword

        #ULONG_PTR WINAPI GetClassLongPtr(
        #  __in  HWND hWnd,
        #  __in  int nIndex)
        #attach_function 'GetClassLongPtrA', [:hwnd, ClassLong], :ulong
        #attach_function 'GetClassLongPtrW', [:hwnd, ClassLong], :ulong

        #int WINAPI GetClassName(
        #  _In_   HWND hWnd,
        #  _Out_  LPTSTR lpClassName,
        #  _In_   int nMaxCount )
        attach_function 'GetClassNameA', [:hwnd, :string, :int], :int
        attach_function 'GetClassNameW', [:hwnd, :string, :int], :int

        #WORD WINAPI GetClassWord(
        #  _In_  HWND hWnd,
        #  _In_  int nIndex )
        attach_function 'GetClassWord', [:hwnd, :int], :word

        #LONG WINAPI GetWindowLong(
        #  __in  HWND hWnd,
        #  __in  int nIndex)
        attach_function 'GetWindowLongA', [:hwnd, ClassLong], :long
        attach_function 'GetWindowLongW', [:hwnd, ClassLong], :long

        #ATOM WINAPI RegisterClass( _In_  const WNDCLASS *lpWndClass )
        attach_function 'RegisterClassA', [WNDCLASS.ptr], :atom
        attach_function 'RegisterClassW', [WNDCLASS.ptr], :atom

        #ATOM RegisterClassEx( __in  const WNDCLASSEX *lpwcx )
        attach_function 'RegisterClassExA', [:pointer], :atom
        attach_function 'RegisterClassExW', [:pointer], :atom

        #DWORD WINAPI SetClassLong(
        #  __in  HWND hWnd,
        #  __in  int nIndex,
        #  __in  LONG dwNewLong)
        attach_function 'SetClassLongA', [:hwnd, ClassLong, :long], :dword
        attach_function 'SetClassLongW', [:hwnd, ClassLong, :long], :dword

        #WORD WINAPI SetClassWord(
        #  _In_  HWND hWnd,
        #  _In_  int nIndex,
        #  _In_  WORD wNewWord )
        attach_function 'SetClassWord', [:hwnd, :int, :word], :word

        #LONG WINAPI SetWindowLong(
        #  __in  HWND hWnd,
        #  __in  int nIndex,
        #  __in  LONG dwNewLong)
        attach_function 'SetWindowLongA', [:hwnd, WindowLong, :long], :long
        attach_function 'SetWindowLongW', [:hwnd, WindowLong, :long], :long

        #BOOL UnregisterClass(
        #  __in      LPCTSTR   lpClassName,
        #  __in_opt  HINSTANCE hInstance)
        attach_function 'UnregisterClassA', [:pointer, :hinstance], :bool
        attach_function 'UnregisterClassW', [:pointer, :hinstance], :bool

        begin
          #LONG_PTR WINAPI GetWindowLongPtr(
          #  __in  HWND hWnd,
          #  __in  int nIndex)
          attach_function 'GetWindowLongPtr',  [:hwnd, :int], :pointer
          attach_function 'GetWindowLongPtrA', [:hwnd, :int], :pointer
          attach_function 'GetWindowLongPtrW', [:hwnd, :int], :pointer

          #LONG_PTR WINAPI SetWindowLongPtr(
          #  __in  HWND hWnd,
          #  __in  int nIndex,
          #  __in  LONG_PTR dwNewLong)
          attach_function 'SetWindowLongPtr',  [:hwnd, WindowLong, :pointer], :pointer
          attach_function 'SetWindowLongPtrA', [:hwnd, WindowLong, :pointer], :pointer
          attach_function 'SetWindowLongPtrW', [:hwnd, WindowLong, :pointer], :pointer
        rescue FFI::NotFoundError
          # In 32-bit Windows, these methods are aliases for GetWindowLong and SetWindowLong
        end
      end
    end
  end
end