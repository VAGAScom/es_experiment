# frozen_string_literal: true

require 'elasticsearch'
require 'singleton'
require 'oj'

require 'es_experiment/version'
require 'es_experiment/actions'
require 'es_experiment/config'
require 'es_experiment/documents'
require 'es_experiment/client'

module EsExperiment
  extend EsExperiment::Actions

  class << self
    def reset_index
      delete_index
      create_index
    end

    def configure
      yield EsExperiment::Config.instance
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
