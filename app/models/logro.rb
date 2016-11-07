class Logro < ActiveRecord::Base
    # has_many :usuario
    include ActiveModel::Validations  #necesario para agregar las condiciones de validacion
    validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}, :uniqueness => {:message => "Error. El nombre de logro elegido ya existe, elija otro nombre."}
	validates :descripcion, :presence => {:message => "Usted debe ingresar una descripcion"}
	validates :limite_inferior_rango, :presence => {:message => "Usted debe ingresar un límite inferior"}, :uniqueness => {:message => "Error. El límite inferior de logro elegido ya existe, elija otro límite inferior."}, :numericality => {:message =>  "Error!Sólo de admiten valores numéricos para los rangos."}
	validates :limite_superior_rango, :presence => {:message => "Usted debe ingresar una límite superior"}, :uniqueness => {:message => "Error. El límite superior de logro elegido ya existe, elija otro límite superior."}, :numericality => {:message =>  "Error!Sólo de admiten valores numéricos para los rangos."}
	default_scope -> { order :limite_inferior_rango }
end