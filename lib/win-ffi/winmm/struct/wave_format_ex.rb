module WinFFI
  module Winmm
    # typedef struct {
    #   WORD  wFormatTag;
    #   WORD  nChannels;
    #   DWORD nSamplesPerSec;
    #   DWORD nAvgBytesPerSec;
    #   WORD  nBlockAlign;
    #   WORD  wBitsPerSample;
    #   WORD  cbSize;
    # } WAVEFORMATEX;
    class WAVEFORMATEX < FFIStruct
      layout :wFormatTag,      :word,
             :nChannels,       :word,
             :nSamplesPerSec,  :dword,
             :nAvgBytesPerSec, :dword,
             :nBlockAlign,     :word,
             :wBitsPerSample,  :word,
             :cbSize,          :word
    end

    def initialize
      super
      self.cbSize = self.size
    end
  end
end