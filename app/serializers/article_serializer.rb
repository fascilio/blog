class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :content
end
