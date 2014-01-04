class AddUseridToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :userid, :string

    User.all.each do |user|
      user.userid = user.username
      user.save
    end

    change_column :users, :userid, :string, :null => false
    add_index :users, :userid, :unique => true
  end

  def self.down
    remove_column :users, :userid
  end
end
