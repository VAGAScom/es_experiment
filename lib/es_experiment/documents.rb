# frozen_string_literal: true

class EsExperiment::Documents
  include Singleton

  def get(key)
    factories[key.to_sym]
  end

  def set(key, value)
    factories[key.to_sym] = value
  end

  def load(config)
    self.factories = {}
    doc_path = config.documents_path
    Dir.foreach(doc_path) do |file|
      next unless valid_file?(config.schema_path, file)

      load_doc(doc_path, file)
    end
    self
  end

  private

  attr_accessor :factories

  def valid_file?(schema_path, file)
    schema = File.basename(schema_path)
    schema != file && file.include?('.json')
  end

  def load_doc(doc_path, file)
    name = File.basename(file, '.json')
    data = Oj.load(File.read(File.join(Dir.pwd, doc_path, file)))
    set(name, data)
  end
end
