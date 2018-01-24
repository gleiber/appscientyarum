#incluir solo en modelos que tengan atributo 'codigo'
module CodeGenerator
  extend ActiveSupport::Concern 

  included do
    after_create :generate_codigo
  end

  def generate_codigo
    letra = self.class.to_s.upcase[0,2]
    self.codigo = letra + ("%03d" % self.id)
    self.save
  end
end