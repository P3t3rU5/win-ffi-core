module WinFFI
  module User32
    class MENUINFO < FFIStruct
      layout :cbSize,          :dword,
             :fMask,           :dword,
             :dwStyle,         :dword,
             :cyMax,           :uint,
             :hbrBack,         :hbrush,
             :dwContextHelpID, :dword,
             :dwMenuData,      :ulong
    end
  end
end