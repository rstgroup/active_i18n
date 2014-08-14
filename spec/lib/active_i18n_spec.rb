require "spec_helper"

describe ActiveI18n do
  describe "set_locale" do 
    it "sets locale" do
      ActiveI18n.setLocale(:de)
      expect(ActiveI18n.locale).to eq(:de)
    end

    it "sets locale also when string is given" do
      ActiveI18n.setLocale("de")
      expect(ActiveI18n.locale).to eq(:de)
    end

    it "doesnt set locale when ist not in the list" do
      ActiveI18n.setLocale("ru")
      expect(ActiveI18n.locale).not_to eq(:ru)
    end
  end


  describe "locale" do 
    it "gets some locale after initialization" do
      expect(ActiveI18n.locale).not_to eq(nil)
    end
  end
end