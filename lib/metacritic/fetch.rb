# frozen_string_literal: true

module Metacritic
  module Fetch
    BASE_URL = 'https://www.metacritic.com'

    def fetch(path, options = {})
      @path = path
      @options = options.dup
      @endpoint = "#{BASE_URL}/#{path}"
      @method = :get
      Metacritic.build_entry(call, :page)
    end
  end
end
