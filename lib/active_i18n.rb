require "activeadmin"
require "active_i18n/engine"
require "active_i18n/base_store"
require "active_i18n/translations_store"
require "active_i18n/active_admin"

module ActiveI18n
  def self.config(config)
    throw "You have to define store for translations" unless config[:store]
    translations_store = config[:store]
    base_store = I18n.backend
    I18n.backend = I18n::Backend::Chain.new(translations_store, base_store)
    BaseStore.set_backend(base_store)
    BaseStore.set_except_filter(config[:except]) if config[:except]
    TranslationsStore.set_backend(translations_store)
  end

  def self.store_translation(value, scope)
    TranslationsStore.store_translation(value, scope, locale)
  end

  def self.setLocale(locale)
    if I18n.available_locales.include?(locale.to_sym)
      @locale = locale.to_sym
      return true
    end
  end

  def self.locale
    @locale ||= I18n.available_locales.sort{|a| a == I18n.default_locale ? 1 : -1}.first
  end
end
