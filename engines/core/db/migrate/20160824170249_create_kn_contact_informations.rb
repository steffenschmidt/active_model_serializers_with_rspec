class CreateKnContactInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :kn_contact_informations do |t|
      t.references :user, foreign_key: true, foreign_key: { to_table: :kn_users }
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
