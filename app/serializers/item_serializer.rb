class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :done, :todo_id
end
