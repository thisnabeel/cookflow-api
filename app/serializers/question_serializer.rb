class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :questionable_type, :questionable_id, :body, :answer
end
