class AddUserIdToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :user_id, :integer
    add_index :answers, :user_id
  end
end
