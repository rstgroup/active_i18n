module ActiveI18n
  class Engine < ::Rails::Engine
    isolate_namespace ActiveI18n

    initializer 'active_skin.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper ActiveI18n::ViewHelper
      end
    end

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
