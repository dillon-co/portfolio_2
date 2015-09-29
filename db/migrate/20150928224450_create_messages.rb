class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.timestamps null: false
      t.integer :number, null: false
      t.string :name, null: false
      t.text :text_message, null: false
    end
  end
end
