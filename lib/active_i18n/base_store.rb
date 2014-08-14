module ActiveI18n
  module BaseStore
    extend(Module.new {
      def set_backend(backend)
        @backend = backend
      end

      def set_except_filter(array)
        @except_filter = array
      end

      def scopes
        translations_hash
      end

      def translations_hash
        t = @backend.send(:translations)[I18n.default_locale]
        t = filter(t) if @except_filter
        t
      end

      def translations(scope)
        return [] unless scope
        scope.split(".").inject(translations_hash){|m,e| m = m[e.to_sym]}.select{|a| !is_scope?(a)}
      end

      def is_scope?(value)
        value.kind_of? Hash
      end

      def filter(original)
        @except_filter.each do |except_scope|
          if except_scope.to_s.split(".").size > 1
          else
            original = original.except(except_scope.to_sym)
          end
        end
        original
      end
    })
  end
end