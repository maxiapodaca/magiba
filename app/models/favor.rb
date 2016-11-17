class Favor < ActiveRecord::Base

	belongs_to :user
	has_many :comments
	has_many :postulations

	default_scope -> {order("updated_at")}

	validates_presence_of :descripcion
	validates :titulo, presence: true, length: { minimum: 4 }
	validates :localidad, presence: true, length: { minimum: 4 }
	#has_many :preguntas
	
end
