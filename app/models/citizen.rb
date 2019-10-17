class Citizen < ApplicationRecord
  	belongs_to :user
  	has_many :owners
  	has_many :demands, through: :owners

  	validate do
  		self.errors.add :cpf, " #{self.cpf} é inválido" if !self.cpf.blank? && !CPF.valid?(self.cpf)
  		self.errors.add :cnpj, " #{self.cnpj} é inválido" if !self.cnpj.blank? && !CNPJ.valid?(self.cnpj)
  		self.errors.add(:base, :cpf_or_cnpj_blank,message: "CPF ou CNPJ devem estar presentes") if self.cpf.blank? && self.cnpj.blank?
  	end
end
