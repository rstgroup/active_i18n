require "spec_helper"

describe ActiveI18n::TranslationsStore do
  describe "unflatten_scope" do
    it "changes dotted string to hash" do
      expect(ActiveI18n::TranslationsStore.send(:unflatten_scope, "value", "ala.ma.kota")).to eq({"ala" => {"ma" => {"kota" => "value"}}})
    end
  end

  describe "store_translation" do 
    it "saves translation" do
      translation = "tak ma kota"
      ActiveI18n::TranslationsStore.store_translation(translation, "ala.ma.kota", ActiveI18n.locale)
      expect(I18n.t("ala.ma.kota", :locale => ActiveI18n.locale)).to eq(translation)
    end
  end
end