module WinFFI
  # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373931(v=vs.85).aspx
  class GUID < FFIAdditions::Struct
    attr_accessor :Data1, :data2, :Data3, :Data4

    layout Data1: :dword,
           Data2: :word,
           Data3: :word,
           Data4: [:byte, 8]

    def from_str(guid)
      data = [guid.gsub(/[{\-}]/, '')].pack('H*').unpack('L>S>2C8')
      self.Data1 = data[0]
      self.Data2 = data[1]
      self.Data3 = data[2]
      3.upto(data.count - 1) do |i|
        self.Data4[i - 3] = data[i]
      end
    end

    def to_s
      str = "%08X-%04X-%04X-%02X%02X-" % [self.Data1, self.Data2, self.Data3, self.Data4[0], self.Data4[1]]
      2.upto(7) do  |i|
        str << "%02X" % self.Data4[i]
      end
      str
    end
  end
end