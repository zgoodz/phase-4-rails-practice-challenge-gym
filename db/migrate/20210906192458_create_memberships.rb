class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :gym, null: false, foreign_key: true
      t.belongs_to :client, null: false, foreign_key: true
      t.integer :charge

      t.timestamps
    end
  end
end
