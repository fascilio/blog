class AddReferenceAuthorArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :author, foreign_key: true
  end
end
