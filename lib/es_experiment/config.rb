# frozen_string_literal: true

class EsExperiment::Config
  include Singleton
  attr_accessor :connection_tries,
                :documents_path,
                :schema_path,
                :index,
                :url
  attr_writer :time_between_connection_tries

  def time_between_connection_tries
    @time_between_connection_tries || 3
  end

  def schema
    @schema ||= Oj.load(File.read(Rails.root.join(schema_path)))
  end
end
