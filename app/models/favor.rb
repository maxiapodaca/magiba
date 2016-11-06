class Favor < ActiveRecord::Base
	validates_presence_of :titulo
	#validates_uniqueness_of :name
	#default_scope -> {order("id_at_desc")}
	validates :titulo, presence: true, length: { minimum: 4 }
	#has_many :preguntas
end
