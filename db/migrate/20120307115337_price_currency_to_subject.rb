class PriceCurrencyToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :price_currency, :string
  end
end