# frozen_string_literal: true

module Metacritic
  class Agent < Mechanize
    include ::Metacritic::Search
    include ::Metacritic::Fetch

    attr_reader :user_agent

    def initialize(user_agent: 'Linux Mozilla')
      super
      @user_agent = user_agent
      self.user_agent_alias = @user_agent
    end

    def call
      send(@method, @endpoint)
    end
  end
end
