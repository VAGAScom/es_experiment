require "es_experiment/version"

module EsExperiment
  require_relative 'es_experiment/actions'

  extend EsExperiment::Actions

  def self.reset_index
    delete_index
    create_index
  end

  def self.configure
    yield EsExperiment::Config.instance
  end

  class Error < StandardError; end
  # Your code goes here...
end
