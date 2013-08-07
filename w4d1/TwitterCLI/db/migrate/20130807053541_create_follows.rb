class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :follower_user_id
      t.integer :followed_user_id

      t.timestamps
    end
  end
end
