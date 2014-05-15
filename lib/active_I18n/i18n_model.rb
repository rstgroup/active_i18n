module ActiveI18n
  module I18nModel
    extend(Module.new {
      def scopes
        translations_hash
      end

      def translations_hash
        t = I18n.backend.send(:translations)[I18n.default_locale]
      end

      def translations(scope)
        return [] unless scope
        scope.split(".").inject(translations_hash){|m,e| m = m[e.to_sym]}.select{|a| !is_scope?(a)}
      end

      def is_scope?(value)
        value.kind_of? Hash
      end
    })
  end
end