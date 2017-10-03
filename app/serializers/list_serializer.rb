class ListSerializer < ActiveModel::Serializer
  attributes :id, :name_list, :content, :date
  has_one :user
end
