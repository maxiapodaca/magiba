class Postulation < ActiveRecord::Base

	validates :descripcion, :presence => {:message => "Usted debe ingresar una descripcion"}
	validates :fecha, :presence => {:message => "Usted debe ingresar una fecha"}    
    belongs_to :favor
	belongs_to :user
	
end
