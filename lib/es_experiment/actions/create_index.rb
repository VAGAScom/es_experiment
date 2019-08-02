# frozen_string_literal: true

module EsExperiment::Actions
  module CreateIndex
    def create_index
      client.indices.create index: config.index, body: config.schema
    end
  end
end
