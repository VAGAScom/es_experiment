# frozen_string_literal: true

RSpec.describe EsExperiment do
  it 'has a version number' do
    expect(EsExperiment::VERSION).not_to be nil
  end

  described_class.configure do |config|
    config.connection_tries = 5
    config.time_between_connection_tries = 7
    config.documents_path = 'spec/fixtures/elastic'
    config.schema_path = 'spec/fixtures/elastic/schema.json'
    config.url = 'localhost:9200'
    config.index = 'indexname'
  end

  describe '.configure' do
    it 'connection tries' do
      expect(EsExperiment::Config.instance.connection_tries).to eq 5
    end

    it 'time between connection tries' do
      expect(EsExperiment::Config.instance.time_between_connection_tries).to eq 7
    end

    it 'documents path' do
      expect(EsExperiment::Config.instance.documents_path).to eq 'spec/fixtures/elastic'
    end

    it 'schema path' do
      expect(EsExperiment::Config.instance.schema_path).to eq 'spec/fixtures/elastic/schema.json'
    end

    it 'url' do
      expect(EsExperiment::Config.instance.url).to eq 'localhost:9200'
    end

    it 'index' do
      expect(EsExperiment::Config.instance.index).to eq 'indexname'
    end
  end

  describe '.create' do
    before do
      described_class.reset_index
    end

    let(:factory_name) { 'professional' }
    let(:fields) do
      { 'personal_data.name' => 'Fulano',
        'personal_data.age' => 30,
        'address.city' => 'First street' }
    end
    let(:options) do
      { type: '_doc',
        id: 'my_id',
        version: 985_737,
        version_type: 'external',
        routing: 'route',
        fields: fields }
    end

    subject do
      described_class.create(factory_name, options)
    end

    it 'when the parameters are valid' do
      expect(subject['result']).to eq 'created'
    end
  end

  describe '.create_list' do
    before do
      described_class.reset_index
    end

    it 'when the parameters are valid' do
      docs = described_class.create_list('professionals_list')
      expect(docs['errors']).to be_falsy
      expect(docs['items'].first['index']['status']).to be 201
      expect(docs['items'].last['index']['status']).to be 201
    end
  end

  describe '.create_index' do
    it 'when the parameters are valid' do
      described_class.delete_index
      response = described_class.create_index
      expect(response['acknowledged']).to be_truthy
    end
  end

  describe '.delete_index' do
    it 'when the parameters are valid' do
      described_class.reset_index
      response = described_class.delete_index
      expect(response['acknowledged']).to be_truthy
    end
  end
end
