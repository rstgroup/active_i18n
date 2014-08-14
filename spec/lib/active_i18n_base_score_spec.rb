require "spec_helper"

describe ActiveI18n::BaseStore do
  describe "translations_hash" do 
    it "returns all translations for default locale" do
      I18n.locale = :pl
      expect(ActiveI18n::BaseStore.translations_hash[:test].size).to eq(2)
    end
  end

  describe "filter" do 
    it "filters out entire keys" do
      ActiveI18n::BaseStore.set_except_filter ["nested_test", "test"]
      expect(ActiveI18n::BaseStore.translations_hash[:test]).to be_nil
    end
  end
end