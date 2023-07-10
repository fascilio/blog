class ChangeColumnArticles < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :content, :rich_text
  end
end
