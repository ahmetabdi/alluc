require 'spec_helper'

describe Alluc::Search do
  let!(:search) { Alluc::Search.new('arrow') }

  describe '.all' do
    it 'should' do
      expect(search.all).to eq('x')
    end
  end
end
