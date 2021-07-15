# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Metacritic::Game do
  context 'when from search' do
    let(:game) do
      VCR.use_cassette('search_super_mario_all') do
        agent = Metacritic::Agent.new
        agent.search('super mario').first
      end
    end

    describe '#title' do
      it 'is set' do
        expect(game.title).to eq('Super Mario 3D World + Bowser\'s Fury')
      end
    end

    describe '#description' do
      # rubocop:disable Layout/LineLength
      it 'is set' do
        expect(game.description).to eq("Super Mario 3D World + Bowser's Fury The cat's out of the bag, Super Mario 3D World is on to the Nintendo Switch system. Pounce and climb through dozens of colorful stages! Mario (and his friends) can use power-ups like the Super...")
      end
      # rubocop:enable Layout/LineLength
    end

    describe '#platform' do
      it 'is set' do
        expect(game.platform).to eq('Switch')
      end
    end

    describe '#year' do
      it 'is set' do
        expect(game.year).to eq('2021')
      end
    end

    describe '#metascore' do
      it 'is set' do
        expect(game.metascore).to eq(89)
      end
    end

    describe '#thumbnail_url' do
      it 'is set' do
        expect(game.thumbnail_url).to eq('https://static.metacritic.com/images/products/games/5/3aabc951f24c35d7351085a71ae61067-78.jpg')
      end
    end
  end
end
