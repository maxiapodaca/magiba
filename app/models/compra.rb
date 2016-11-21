class Compra < ActiveRecord::Base
	belongs_to :card
	include ActiveModel::Validations
	validates :cantidad_de_puntos, :presence => {:message => "Usted debe ingresar la cantidad de puntos a comprar."},:numericality => {:message =>  "Error!Sólo de admiten valores numéricos para la cantidad de puntos a comprar."} 

end
