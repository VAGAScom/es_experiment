# frozen_string_literal: true

module EsExperiment::Actions
  module CreateList
    def create_list(name)
      docs = documents.get(name)
      docs = docs.map do |doc|
        { index: { _index: config.index, _type: '_doc', data: doc } }
      end
      client.bulk(body: docs)
    end
  end
end
