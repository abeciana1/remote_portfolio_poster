
class ClubSerializer < ActiveModel::Serializer
    attributes :id, :content, :likes, :created_at

end