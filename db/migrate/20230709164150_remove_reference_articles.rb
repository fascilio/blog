class RemoveReferenceArticles < ActiveRecord::Migration[7.0]
  def change
    remove_reference :articles, :author, index: false
  end
end
