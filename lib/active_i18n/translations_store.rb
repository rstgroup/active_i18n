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
          strip_first([scope, value].join("."))
        end

        def strip_first(str)
          a = str.split(".")
          return a.first if a.size < 2
          hash = Hash.new
          hash[a.shift] = strip_first(a.join("."))
          hash
        end
    })
  end
end