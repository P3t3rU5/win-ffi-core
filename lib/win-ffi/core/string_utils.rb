module WinFFI
  module StringUtils
    refine ::String do

      def to_utf8
        encode('utf-8')
      end

      def to_w
        encode('utf-16LE')
      end
    end

    refine ::Object do
      def to_utf8
        to_s.to_utf8
      end

      def to_w
        to_s.to_w
      end
    end
  end
end