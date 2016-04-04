module WinFFI
  module User32
    class << self
      #define IS_INTRESOURCE(_r) ((((ULONG_PTR)(_r)) >> 16) == 0)
      def IS_INTRESOURCE(r)
        r >> 16 == 0
      end

      #define MAKEINTRESOURCEA(i) ((LPSTR)((ULONG_PTR)((WORD)(i))))
      #define MAKEINTRESOURCEW(i) ((LPWSTR)((ULONG_PTR)((WORD)(i))))
      def MAKEINTRESOURCE(i)
        i
      end
    end
  end
end