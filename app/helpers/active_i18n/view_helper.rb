module ActiveI18n
  module ViewHelper
    def render_scopes
      capture_haml do
        ActiveI18n::BaseStore.scopes.each_pair do |key, value|
          haml_concat li_scope(key, value, key.to_s)
        end
      end
    end

    def available_locales
      capture_haml do
        haml_tag :select, id: "change_locale" do 
          I18n.available_locales.each do |locale|
            haml_tag :option, 
                value: locale, 
                selected: locale == ActiveI18n.locale, 
                data: {url: url_for(translation_locale: locale)} do 
              haml_concat [locale.to_s, I18n.t(locale, :scope => "active_i18n.languages", :locale => :en)].join(" - ")
            end
          end
        end
      end
    end

    def li_scope(key, value, scope)
      return unless ActiveI18n::BaseStore.is_scope?(value)
      capture_haml do
        haml_tag :li, :class => params[:scope].to_s.match(scope) ? "selected" : "unselected" do 
          haml_tag :p do 
            haml_tag(:i, "", :class => "close fa fa-folder")
            haml_tag(:i, "", :class => "open fa fa-folder-open")
            haml_tag :a, :href => admin_translations_path(scope: scope) do 
              haml_concat key
            end
          end
          haml_tag :ul do
            haml_concat value.collect{|k, v| li_scope(k, v, scope+"."+k.to_s)}.join("").html_safe
          end
        end
      end
    end

    def scope_table(scope)
      capture_haml do 
        ActiveI18n::BaseStore.translations(scope).each do |e|
          
        end
      end
    end

    def linkify_scope(scope="")
      link_scopes = []
      capture_haml do 
        scope.to_s.split(".").each_with_index do |key, i|
          haml_tag :span, ">>", :class => "breadcrumb_sep" if i!=0
          link_scopes.push key
          haml_tag :a, :href => admin_translations_path(scope: link_scopes.join(".")) do 
            haml_tag :i, :class => "fa fa-folder-open"
            haml_concat key.to_s
          end
        end
      end
    end
  end
end
