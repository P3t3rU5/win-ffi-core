module WinFFI
  module User32
    class MENUITEMTEMPLATE < FFIStruct
      layout :mtOption,  :word,
             :mtID,      :word,
             :mtString,  :char
    end
  end
end