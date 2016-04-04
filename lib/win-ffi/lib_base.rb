require 'ffi'
require 'logger'
require 'win-ffi/struct'

module WinFFI
  @logger = Logger.new(STDOUT)
  @logger.info "WinFFI #{VERSION}"
  def self.logger
    @logger
  end

  WinFFI.logger.debug 'Getting Encoding...'
  @encoding = (__ENCODING__.name =~ /ASCII/ ? 'A' : 'W')
  WinFFI.logger.debug 'Got Encoding: ' + @encoding

  def self.encoding
    @encoding
  end

  def self.encoding=(encoding)
    @encoding = encoding
  end

  module LibBase
    extend FFI::Library
    ffi_convention :stdcall

    typedef (WinFFI.encoding == 'A' ? :char : :ushort), :tchar
    typedef :ushort,    :atom
    typedef :uchar,     :byte
    typedef :ushort,    :word
    typedef :uint,      :dword
    typedef :uint,      :colorref
    typedef :uint,      :wparam
    typedef :long,      :lparam
    typedef :long,      :lresult
    typedef :long,      :hresult
    typedef :ushort,    :langid
    %i'
      handle
      hbitmap
      hbrush
      hdc
      hglobal
      hicon
      hinstance
      hmodule
      hwnd
    '.each do |s|
      typedef :pointer, s
    end

    def encoded_function(name, *args, ruby_name: nil)
      ruby_name = name unless ruby_name
      attach_function ruby_name, name + WinFFI.encoding, *args
    end

    if WinFFI.encoding == 'A'
      def self.string_from_byte_array(array)
        array[0, array.index(0) || array.length].pack('C*').encode(Encoding::UTF_8)
      end
    else
      def self.string_from_byte_array(array)
        array = array[0, array.index(0) || array.length]
        array.pack('S*').force_encoding(Encoding::UTF_16LE).encode(Encoding::UTF_8)
      end
    end

    def self.extended(c)
      c.extend FFI::Library
      instance_variables.each do |v|
        value = instance_variable_get(v)
        value = value.dup unless value.is_a?(Fixnum) || value.is_a?(Symbol)
        c.instance_variable_set(v, value)
      end
    end
  end


  require 'win-ffi/kernel32/struct/os_version_info_ex'

  module Kernel32
    extend LibBase

    ffi_lib 'kernel32'

    #BOOL WINAPI GetVersionEx( _Inout_  LPOSVERSIONINFO lpVersionInfo )
    encoded_function 'GetVersionEx', [OSVERSIONINFOEX.ptr], :bool
  end

  WinFFI.logger.debug 'Getting Architecture...'
  Architecture = RbConfig::CONFIG['arch'] # "i386-mingw32" | "x64-mingw32"
  WinFFI.logger.debug 'Got Architecture: ' + Architecture

  WinFFI.logger.debug 'Getting Windows Version...'
  WindowsVersion = OSVERSIONINFOEX.new.get!
  WinFFI.logger.debug "Got Windows Version: #{WindowsVersion.hex}-> #{WindowsVersion.to_s}"

  WindowsVersion.major, WindowsVersion.minor, WindowsVersion.build = `ver`.match(/\d+\.\d+\.\d+/)[0].split('.').map(&:to_i)

  @logger.info "#{WindowsVersion.to_s} #{Architecture} #{__ENCODING__.to_s}"

end

