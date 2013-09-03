require 'ffi'

module WinFFI
  VERSION = '0.0.1'
  module LibBase

    extend FFI::Library
    ffi_convention :stdcall

    typedef :ushort,    :atom
    typedef :uchar,     :byte
    typedef :ushort,    :word
    typedef :uint,      :dword
    typedef :uint,      :colorref
    typedef :uint,      :wparam
    typedef :long,      :lparam
    typedef :long,      :lresult
    %i'haccel handle hbitmap hbrush hconv hcursor hdc hddedata hdesk hgdiobj hglobal hicon hinstance hkl hmenu hmetafile hmonitor hmodule hrgn hsz hwnd hwinsta'.each do |s|
      typedef :pointer, s
    end

    def self.extended(c)
      c.extend FFI::Library
      instance_variables.each do |v|
        value = instance_variable_get(v)
        value = value.dup unless value.is_a?(Fixnum) || value.is_a?(Symbol)
        c.instance_variable_set(v, value)
      end
      puts "Loading #{c.name}"
    end
  end
end

%w'
  point
  size
  rect
  paint_struct
'.each { |f| require_relative "windows/structs/#{f}" }
%w'
  color_types
  lr
'.each { |f| require_relative "windows/enums/#{f}" }

%w'
  system_info
  gdi32
  kernel32
  user32
  comdlg32
  device
  handle
  power
  process
  resource
  shell
  string
'.each { |f| require_relative "windows/#{f}" }

%w'
  authorization
  device
  error
  thread
'.each { |f| require_relative "windows/#{f}" } if WinFFI::WindowsVersion >= :xp