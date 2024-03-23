class AddUserIdToBooks < ActiveRecord::Migration[6.1]
  def up
    add_reference :books, :user, foreign_key: true
  end

  def down
    remove_reference :books, :user, foreign_key: true
  end
end