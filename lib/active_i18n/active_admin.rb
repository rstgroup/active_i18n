
ActiveAdmin.module_eval do
  def self.register_translation name, menu_options = {}

    self.register_page name do
      menu({:label => proc{ I18n.t("active_i18n.labels.translations") }}.merge(menu_options))

      sidebar "Translations", :class => "active", :partial => "active_i18n/sidebar"

      content do
        render("active_i18n/content")
      end

      controller do
        before_filter :set_locale, :only => :index

        def set_locale
          ActiveI18n.setLocale(params[:translation_locale]) if params[:translation_locale]
        end
      end

      page_action :translate, :method => :post do
        ActiveI18n.store_translation(params[:translation], [params[:scope], params[:key]].join("."))
        render :text => params[:translation]
      end
    end
  end
end