# frozen_string_literal: true

require_relative 'actions/create'
require_relative 'actions/create_list'
require_relative 'actions/create_index'
require_relative 'actions/delete_index'

module EsExperiment::Actions
  include EsExperiment::Actions::Create
  include EsExperiment::Actions::CreateList
  include EsExperiment::Actions::CreateIndex
  include EsExperiment::Actions::DeleteIndex

  private

  def client
    EsExperiment::Client.instance.connection(config)
  end

  def config
    EsExperiment::Config.instance
  end

  def documents
    EsExperiment::Documents.instance.load(config)
  end
end
