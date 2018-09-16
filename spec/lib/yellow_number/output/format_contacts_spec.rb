require 'spec_helper'

RSpec.describe YellowNumber::Output::FormatContacts do
  describe '.call' do
    subject(:call) { described_class.call(contacts, formatter: formatter) }

    let(:contacts) { [ { name: 'Foo', number: ' 0000-0000', address: 'Bar Street, 123' } ] }
    let(:formatter) { spy(:formatter, call: mocked_formatter_output) }
    let(:mocked_formatter_output) { "I am Formatted" }

    it 'calls selected formatter' do
      call
      expect(formatter).to have_received(:call).with(contacts)
    end

    it 'returns formatter output' do
      is_expected.to eq(mocked_formatter_output)
    end
  end
end
