To add Foreign Key
rails g migration add_user_id_to_questions user_id:integer:index
rails db_migrate
rails g migration add_foreign_keys_to_questions_users     
after that add add_foreign_key "questions", "users" in change method of migation
rails db_migrate
------------------
To Solve Error ActiveRecord::InvalidForeignKey 
added dependent :destroy to Model
