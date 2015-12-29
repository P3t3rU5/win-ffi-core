module WinFFI
  module Comctl32
    class TBSAVEPARAMS < FFIStruct
      layout :hkr,          :hkey,
             :pszSubKey,    :string,
             :pszValueName, :string
    end
  end
end