module WinFFI
  module Kernel32
    extend LibBase
  end
end

%w'
  memory
  sound
  time
'.each { |f| require_relative "kernel32/#{f}" }

%w'
  dll
  filesystem
  memory
  volume
'.each { |f| require_relative "kernel32/#{f}" } if WinFFI::WindowsVersion >= :xp