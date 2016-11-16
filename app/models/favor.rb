class Favor < ActiveRecord::Base
	#validates_presence_of :titulo
	validates_presence_of :descripcion
	#validates_presence_of :localidad
	#validates_uniqueness_of :name
	default_scope -> {order("updated_at")}
	validates :titulo, presence: true, length: { minimum: 4 }
	#validates :descripcion, presence: true, length: { minimum: 4 }

	validates :localidad, presence: true, length: { minimum: 4 }
	#has_many :preguntas
	has_many :postulations
	belongs_to :user
end
