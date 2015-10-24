class CreateGuestMailers < ActiveRecord::Migration
  def change
    create_table :guest_mailers do |t|

      t.timestamps null: false
      t.string :email, null: false
      t.text :message, null: false
    end
  end
end
