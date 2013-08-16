module WinFFI
  module Kernel32

  end
end

%w'
  dll
  memory
  sound
  time
  volume
'.each { |f| require_relative "kernel32/#{f}" }