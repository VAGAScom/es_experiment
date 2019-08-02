# frozen_string_literal: true

class EsExperiment::ConexaoError < StandardError
  def initialize(msg = 'Conexão com ES falhou')
    super msg
  end
end
