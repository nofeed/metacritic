# frozen_string_literal: true

require 'addressable'
require 'facets'
require 'mechanize'

require 'metacritic/search'
require 'metacritic/search_results'
require 'metacritic/version'
require 'metacritic/agent'
require 'metacritic/entry'
require 'metacritic/entries/game'

module Metacritic
  class Error < StandardError; end

  def self.build_entry(search_result)
    Metacritic::Game.new(search_result) if search_result.search('div.main_stats p').text.include?('Game')
  end
end
