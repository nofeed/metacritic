# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Metacritic::Agent do
  describe '#user_agent' do
    it 'has a default' do
      expect(subject.user_agent).to eq('Linux Mozilla')
    end

    it 'can be set during initialization' do
      subject = Metacritic::Agent.new(user_agent: 'Windows Chrome')
      expect(subject.user_agent).to eq('Windows Chrome')
    end
  end
end
