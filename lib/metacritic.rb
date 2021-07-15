# frozen_string_literal: true

require 'addressable'
require 'facets'
require 'mechanize'

require 'metacritic/search'
require 'metacritic/search_results'
require 'metacritic/fetch'
require 'metacritic/version'
require 'metacritic/agent'
require 'metacritic/entry'
require 'metacritic/entries/game'

module Metacritic
  class Error < StandardError; end

  def self.build_entry(content, origin = :search)
    Metacritic::Game.new(content, origin) if send("game_from_#{origin}?", content)
  end

  def self.game_from_search?(content)
    content.search('div.main_stats p').text.include?('Game')
  end

  def self.game_from_page?(content)
    content.uri.to_s.include?('/game/')
  end
end
