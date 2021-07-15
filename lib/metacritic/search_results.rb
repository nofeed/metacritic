# frozen_string_literal: true

module Metacritic
  class SearchResults
    include Enumerable

    def initialize(results_page)
      @results_page = results_page
    end

    def each
      @results_page.search('ul.search_results li').each do |content|
        yield Metacritic.build_entry(content, :search)
      end
    end

    def size
      @results_page.search('p.query_results').text.to_i
    end
  end
end
