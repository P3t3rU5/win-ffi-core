module WinFFI
  module BooleanUtils
    refine ::TrueClass do

      def to_native
        1
      end

      alias_method :to_n, :to_native
      alias_method :to_c, :to_native
    end

    refine ::FalseClass do

      def to_native
        0
      end

      alias_method :to_n, :to_native
      alias_method :to_c, :to_native
    end

    refine ::NilClass do

      def to_native
        0
      end

      alias_method :to_n, :to_native
      alias_method :to_c, :to_native
    end
  end

end