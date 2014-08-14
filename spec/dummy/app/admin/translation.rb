ActiveAdmin.register_translation "Translations", 
  :parent => "CMS", 
  :priority => 4, 
  :label => proc{ I18n.t("active_i18n.labels.translations") }
