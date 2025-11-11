class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    # まだ存在していない場合だけ追加する安全な書き方

    add_column :users, :occupation, :string unless column_exists?(:users, :occupation)
    add_column :users, :affiliation, :string unless column_exists?(:users, :affiliation)
    add_column :users, :position,    :string unless column_exists?(:users, :position)
  end
end
