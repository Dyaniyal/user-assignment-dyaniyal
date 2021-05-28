class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :user
      t.string :address_line
      t.string :street
      t.string :land_mark
      t.string :state
      t.string :pincode

      t.timestamps
    end
  end
end
