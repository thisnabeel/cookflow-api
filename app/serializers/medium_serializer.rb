class MediumSerializer < ActiveModel::Serializer
  attributes :id, :mediable_type, :mediable_id, :media_url, :media_type, :description, :title, :position
end
