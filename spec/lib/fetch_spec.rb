# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Metacritic::Fetch do
  let(:agent) { Metacritic::Agent.new }

  context 'fetch game' do
    before do
      VCR.use_cassette('fetch_witcher_3') do
        @page = agent.fetch('game/playstation-4/the-witcher-3-wild-hunt')
      end
    end

    it 'returns the full url' do
      expect(agent.endpoint.to_s).to eq('https://www.metacritic.com/game/playstation-4/the-witcher-3-wild-hunt')
    end

    it 'returns a game' do
      expect(@page).to be_a(Metacritic::Game)
    end
  end
end
