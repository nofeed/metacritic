# frozen_string_literal: true

module Metacritic
  class Entry
    attr_reader :content

    def initialize(content, origin = :search)
      @content = content
      @origin = origin
    end

    def title
      @title ||= content.search('.product_title').text.tr("\n", '').squish
    end

    def description
      @description ||= content.search('.basic_stat').text.tr("\n", '').squish
    end

    def year
      @year ||= content.search('div.main_stats p').text.split(',')[1].squish
    end

    def metascore
      @metascore ||= content.search('.metascore_w').text.to_i
    end
  end
end
