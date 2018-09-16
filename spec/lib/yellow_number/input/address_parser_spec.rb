require 'spec_helper'

RSpec.describe YellowNumber::Input::AddressParser do
  let(:instance) { described_class }

  describe '.call' do
    subject(:parsed_address) { instance.call(address_line) }

    let(:address_line) { 'Rua Professor Legal, 124, São Paulo' }

    it 'returns the street' do
      expect(parsed_address[:street]).to eq('Rua Professor Legal')
    end

    it 'returns the number' do
      expect(parsed_address[:number]).to eq(124)
    end

    it 'returns the city as nil' do
      expect(parsed_address[:city]).to eq('São Paulo')
    end
  end
end
