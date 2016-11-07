class Favor < ActiveRecord::Base
	validates_presence_of :titulo
	#validates_uniqueness_of :name
	default_scope -> {order("updated_at")}
	validates :titulo, presence: true, length: { minimum: 4 }
	#has_many :preguntas
end
