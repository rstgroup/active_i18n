module ActiveI18n
  module TranslationsStore
    extend(Module.new {
      def set_backend(backend)
        @backend = backend
      end

      def store_translation(value, scope, locale)
        @backend.store_translations(locale, unflatten_scope(value, scope))
      end

      private
        def unflatten_scope(value, scope)
          strip_first(value, scope)
        end

        def strip_first(value, str)
          a = str.split(".")
          return value unless a.any?
          hash = Hash.new
          hash[a.shift] = strip_first(value, a.join("."))
          hash
        end
    })
  end
end