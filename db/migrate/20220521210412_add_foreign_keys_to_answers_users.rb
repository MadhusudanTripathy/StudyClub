class AddForeignKeysToAnswersUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "answers", "users"
  end
end
