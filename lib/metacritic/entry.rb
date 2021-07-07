# frozen_string_literal: true

module Metacritic
  class Entry
    attr_reader :content

    def initialize(content)
      @content = content
    end

    def title
      @title ||= content.search('.product_title').text.tr("\n", '').strip
    end
  end
end
