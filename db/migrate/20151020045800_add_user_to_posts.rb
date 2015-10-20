class AddUserToPosts < ActiveRecord::Migration

  #here, we associate users and posts to add a user_id column to the posts table
  #the user_id will allow a single user to have many posts
  #we also added an index to the user_id column.
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
  end
end
