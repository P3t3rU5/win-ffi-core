module WinFFI
  module User32
    # Menu item resource format
    class MENUITEMTEMPLATEHEADER < FFIStruct
      layout :versionNumber, :word,
             :offset,        :word
    end
  end
end