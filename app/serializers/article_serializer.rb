class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :content
  belongs_to :author
end
