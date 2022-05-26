class CreateAnswerReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_reactions do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
