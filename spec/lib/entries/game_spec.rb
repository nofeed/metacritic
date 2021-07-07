# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Metacritic::Game do
  let(:game) do
    VCR.use_cassette('search_super_mario_all') do
      agent = Metacritic::Agent.new
      agent.search('super mario').first
    end
  end

  describe '#title' do
    it 'sets the title from content' do
      expect(game.title).to eq('Super Mario 3D World + Bowser\'s Fury')
    end
  end
end
