# frozen_string_literal: true

module Metacritic
  module Search
    BASE_URL = 'https://www.metacritic.com/search'

    attr_reader :endpoint

    def search(query, options = {})
      @query = query
      @options = options.dup
      @endpoint = generate_endpoint
      @method = :get
      Metacritic::SearchResults.new(call)
    end

    def media_type
      @media_type ||= @options.fetch(:media_type, 'all')
    end

    private

    def generate_endpoint
      Addressable::Template.new(
        "#{BASE_URL}{/media_type}{/query}/results"
      ).expand(media_type: media_type, query: @query)
    end
  end
end
