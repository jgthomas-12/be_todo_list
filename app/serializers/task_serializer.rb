class TaskSerializer
include JSONAPI::Serializer

attributes :name, :description, :completed
end