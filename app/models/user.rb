class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  has_many :compra
  has_many :cards
  belongs_to :logro
  belongs_to :postulacion
  has_many :favors
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

    validates :name, presence: true, length: { minimum: 3 }
	validates :apellido, presence: true, length: { minimum: 3 }
	validates :telefono, presence: true, length: { minimum: 3 }
	validates :localidad, presence: true, length: { minimum: 3 }
	validates :dni, presence: true, uniqueness: true, length: {is: 8}
	validates_numericality_of :dni, :message => "Debe ingresar numeros"
	
end
