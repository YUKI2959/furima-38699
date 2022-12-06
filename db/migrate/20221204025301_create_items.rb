class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,         null: false, default: ""
      t.text       :item_text,         null: false
      t.integer    :item_category_id,  null: false
      t.integer    :item_condition_id, null: false
      t.integer    :ship_charge_id,    null: false
      t.integer    :area_id,           null: false
      t.integer    :ship_day_id,       null: false
      t.integer    :item_price,        null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
