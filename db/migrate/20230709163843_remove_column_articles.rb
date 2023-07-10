class RemoveColumnArticles < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :articles, :users, column: :author_id
  end
end
