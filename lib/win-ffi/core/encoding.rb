module WinFFI
  @encoding = 'A'.freeze

  def self.ascii?
    @encoding == 'A'
  end

  def self.wide?
    @encoding == 'W'
  end

  def self.encoding=(v)
    raise ArgumentError, "Invalid Encoding #{v.inspect}" unless ['A', 'W'].include?(v)
    @encoding = v.dup.freeze
  end

  def self.encoding
    @encoding
  end

  def self.complement_encoding
    ascii? ? 'W' : 'A'
  end
end