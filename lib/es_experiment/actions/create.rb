# frozen_string_literal: true

module EsExperiment::Actions
  module Create
    def create(name, options = {})
      client.index params(name, options)
    end

    private

    def params(name, options)
      { index: config.index,
        type: options[:type] || '_doc',
        id: options[:id],
        body: doc(name, options),
        version: options[:version],
        version_type: options[:version_type],
        routing: options[:routing],
        refresh: true }.compact
    end

    def doc(name, options)
      doc = documents.get(name)
      update(doc, options[:fields]) unless options[:fields].nil?
      doc
    end

    # rubocop:disable Security/Eval
    def update(doc, fields)
      fields.each do |full_key, value|
        eval <<-RUBY, binding, __FILE__, __LINE__ + 1
          doc#{parse_key(full_key)} = #{parse_value(value)}
        RUBY
      end
    end
    # rubocop:enable Security/Eval

    def parse_key(full_key)
      full_key
        .to_s
        .split('.')
        .map { |key| "['#{key}']" }
        .join
    end

    def parse_value(value)
      return "'#{value}'" if value.is_a? String

      value
    end
  end
end
