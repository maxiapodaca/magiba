class Favor < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :postulations, dependent: :destroy

	validates_presence_of :descripcion
	validates :imagen, :format => URI::regexp(%w(http https))
		
	validates :titulo, presence: true, length: { minimum: 4 }
	validates :localidad, presence: true, length: { minimum: 4 }
	#has_many :preguntas
end
