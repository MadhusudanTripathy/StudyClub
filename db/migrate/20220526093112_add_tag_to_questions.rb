class AddTagToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :tag, :string
  end
end
