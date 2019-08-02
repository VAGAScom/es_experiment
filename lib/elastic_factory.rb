# frozen_string_literal: true

module EsExperiment
  require_relative 'elastic_factory/actions'

  extend EsExperiment::Actions

  def self.reset_index
    delete_index
    create_index
  end

  def self.configure
    yield EsExperiment::Config.instance
  end
end
