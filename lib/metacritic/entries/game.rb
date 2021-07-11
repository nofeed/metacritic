# frozen_string_literal: true

module Metacritic
  class Game < Entry
    def platform
      content.search('div.main_stats p').text.split(',')[0].gsub('Game', '').squish
    end
  end
end
