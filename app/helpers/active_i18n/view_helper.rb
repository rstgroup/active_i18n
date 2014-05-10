module ActiveI18n
  module ViewHelper

    def render_scopes
      content_tag :ul do
        ActiveI18n::I18nModel.scopes.each_pair do |key, value|
          concat li_scope(key, value)
        end
      end
    end

    def li_scope(key, value)
      return unless is_scope?(value)
      content_tag :li do 
        concat content_tag(:p, content_tag(:i, "", :class => "fa fa-folder") + key)
        concat content_tag(:ul, value.collect{|k, v| li_scope(k, v)}.join("").html_safe)
      end
    end

    def is_scope?(value)
      value.kind_of? Hash
    end
  end
end