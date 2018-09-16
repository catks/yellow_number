require 'spec_helper'

RSpec.describe YellowNumber::Output::FormatContacts do
  describe '.call' do
    subject(:call) { described_class.call(contacts) }

    let(:contacts) { [{ name: 'Foo', number: ' 0000-0000', address: 'Bar Street, 123' }]}
    let(:expected_output) { "Nome,Número,Endereço\nFoo, 0000-0000,\"Bar Street, 123\"\n" }

    it 'format to csv' do
      is_expected.to eq(expected_output)
    end
  end
end
