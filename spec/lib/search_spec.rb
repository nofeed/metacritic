# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Metacritic::Search do
  let(:agent) { Metacritic::Agent.new }

  describe '#search' do
    context 'all media types' do
      before do
        VCR.use_cassette('search_super_mario_all') do
          @results = agent.search('super mario')
        end
      end

      it 'defaults to `all` media types' do
        expect(agent.endpoint.to_s).to eq('https://www.metacritic.com/search/all/super%20mario/results')
      end

      it 'returns results' do
        expect(@results).to be_a(Metacritic::SearchResults)
        expect(@results.first).to be_a(Metacritic::Game)
      end
    end
  end
end
