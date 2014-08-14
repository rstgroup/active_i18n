ActiveI18n.config(
  store: I18n::Backend::KeyValue.new(Redis.new)
)