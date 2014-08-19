require "spec_helper"

describe ActiveI18n::TranslationsStore do
  [Redis.new, {}].each do |store_kind|
    describe "#{store_kind.class.to_s} as a store" do 
      before (:each) do
        ActiveI18n.config(
          store: I18n::Backend::KeyValue.new(store_kind),
          except: nil
        )
      end
    end

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

      it "saves translation with dots" do
        translation = "tak ma .kota"
        ActiveI18n::TranslationsStore.store_translation(translation, "ala.ma.kota", ActiveI18n.locale)
        expect(I18n.t("ala.ma.kota", :locale => ActiveI18n.locale)).to eq(translation)
      end
    end
  end
end