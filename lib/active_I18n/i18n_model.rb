module ActiveI18n
  module I18nModel
    extend(Module.new {
      def scopes
        translations_hash
      end

      def translations_hash
        t = I18n.backend.send(:translations)[I18n.default_locale]
      end
    })
  end
end