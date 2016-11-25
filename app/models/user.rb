class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  has_many :compra
  has_many :cards
  #belongs_to :logro

  has_many :postulation, dependent: :destroy
  has_many :favors, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  validates :name, presence: true, length: { minimum: 3 }
	validates :apellido, presence: true, length: { minimum: 3 }
	validates :telefono, presence: true, length: { minimum: 3 }
	validates :localidad, presence: true, length: { minimum: 3 }
	validates :dni, presence: true, uniqueness: true, length: {is: 8}
	validates_numericality_of :dni, :message => "Debe ingresar numeros"


  def logro
    logro = Logro.where("limite_inferior_rango <= ? AND limite_superior_rango >= ?", self.puntos, self.puntos).take
    return logro unless logro.nil?
    Logro.where("limite_superior_rango < ?", self.puntos).order(:limite_superior_rango).last
  end
	
end
