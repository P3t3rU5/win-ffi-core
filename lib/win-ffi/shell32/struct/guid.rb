module WinFFI
  module Shell32
    # typedef struct _GUID {
    #   DWORD Data1;
    #   WORD  Data2;
    #   WORD  Data3;
    #   BYTE  Data4[8];
    # } GUID;
    class GUID < FFIStruct
      layout :Data1, :dword,
             :Data2, :word,
             :Data3, :word,
             :Data4, [:byte, 4]
    end
  end
end