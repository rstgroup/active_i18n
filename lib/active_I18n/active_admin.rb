
ActiveAdmin.module_eval do
  def self.register_translation name

    self.register_page name do
      menu :priority => 2, :label => proc{ I18n.t("active_i18n.translations") }

      content :title => proc{ I18n.t("active_admin.dashboard") } do
        div :class => "blank_slate_container", :id => "dashboard_default_message" do
          span :class => "blank_slate" do
            span "jeas"
            small "jeas"
          end
        end
      end
    end
  end
end