require 'ffi'
require 'ffi-additions/struct'

require_relative 'logger'
require_relative 'core/version'

require_relative 'core/boolean_utils'

module WinFFI
  LOGGER.info "WinFFI v#{WinFFI::VERSION}"

  MAX_PATH = 260

  def self.init(encoding: "A")
    WinFFI.encoding = encoding
    require_relative 'core/lib_base'
    require_relative 'core/string_utils'
    require_relative 'core/macro/util'
  end
end