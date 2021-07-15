# frozen_string_literal: true

module Metacritic
  class Entry
    attr_reader :content

    def initialize(content, origin = :search)
      @content = content
      @origin = origin
    end

    def title
      @title ||= if search?
                   content.search('.product_title').text.tr("\n", '')
                 elsif page?
                   content.search('.product_title h1').text
                 end.squish
    end

    def page_path
      @page_url ||= content.search('.product_title a').attr('href').text if search?
    end

    def slug
      @slug ||= page_path.split('/').last if search?
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

    def thumbnail_url
      @thumbnail_url ||= content.search('.result_thumbnail img').attr('src').text
    end

    private

    { search?: :search, page?: :page }.each do |meth, key|
      define_method meth do
        @origin == key
      end
    end
  end
end
