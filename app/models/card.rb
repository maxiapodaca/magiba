class Card < ActiveRecord::Base
	@año_actual=Time.now.strftime("%Y").to_i
	belongs_to :user
	has_many :compras	
	include ActiveModel::Validations  #necesario para agregar las condiciones de validacion
    validates :nombre, :presence => {:message => "Usted debe ingresar el tipo de tarjeta. Ej: Cabal."}
	validates :anio_vencimiento, :presence => {:message => "Usted debe ingresar el año de vencimiento de la tarjeta."},:numericality => {:message =>  "Error!Sólo de admite valor numéricos para el año."}, :numericality => { :greater_than_or_equal_to => @año_actual, :message => "Se ha ingresado un año de vencimiento inferior al año actual."} 
	validates :mes_vencimiento, :presence => {:message => "Usted debe ingresar el mes de vencimiento de la tarjeta."}, :numericality => {:message =>  "Error!Sólo de admite valor numéricos para el mes."}, :numericality => { :less_than_or_equal_to => 12, :message => "Se ha ingresado un mes de vencimiento inválido."},:numericality => { :greater_than_or_equal_to => 1, :message => "Se ha ingresado un mes de vencimiento inválido."}
	validates :nombre_prop, :presence => {:message => "Usted debe ingresar el nombre del titular."}
	validates :apellido_prop, :presence => {:message => "Usted debe ingresar el apelido del titular."}
	validates :cod_seguridad, :presence => {:message => "Usted debe ingresar el código de seguridad de la tarjeta."}, :numericality => {:message =>  "Error! El código de seguridad solo admite valores numéricos."}, length: {is: 3, :message =>  "Error! El códgio de seguridad debe contener 3 números." }
	validates :dni_titular, :presence => {:message => "Usted debe ingresar el DNI del titular."},:numericality => {:message =>  "Error! Caracteres inválidos para el DNI"},length: {is: 8, :message =>  "Error! El DNI debe contener exactamente 8 números." }	
	validate :formato_numero_tarjeta
	validate :tarjeta_existe_aleatorio
	def formato_numero_tarjeta
		@mensaje=false
		if (((numero[0,4]=~/\D/) != nil) or ((numero[5,4]=~/\D/) != nil) or ((numero[10,4]=~/\D/) != nil) or ((numero[15,4]=~/\D/)!= nil))
			@mensaje=true
		end
		if ((numero[4]!="-") or (numero[4]!="-") or (numero[4]!="-") or (numero[4]!="-")) 
			@mensaje=true
		end
		if @mensaje==true
			errors.add(:formato_erroneo, "Error! El formato de numero de tarjeta debe ser XXXX-XXXX-XXXX-XXXX.")
		end	
	end
	def tarjeta_existe_aleatorio
		if (rand(2) == 1) 
			errors.add(:no_existe, "Error! La tarjeta ingresada no existe, intente nuevamente.")
		end
	end
end
#, :numericality => {:message =>  "Error!Sólo de admite un valor numérico para el año de vencimiento."}
#:message => "El año de vencimiento debe ser igual o mayor al año actual"