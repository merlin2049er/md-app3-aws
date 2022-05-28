# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
      mappings dynamic: false do
        # indexes :title

        indexes :body, type: :object do
          indexes :body
        end
      end
    end

    def as_indexed_json(_options = {})
      as_json(include: { body: { only: :body } })
    end
  end
end
