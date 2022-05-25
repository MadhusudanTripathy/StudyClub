class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :qualification
      t.string :institute_name
      t.string :city
      t.text :bio
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.timestamps
    end
  end
end
