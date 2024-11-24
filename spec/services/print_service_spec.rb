RSpec.describe GemTemplate::PrintService do
  describe '#initialize' do
    context 'when called without an object' do
      subject { described_class.new(object: nil) }
      it { expect { subject }.to raise_error(described_class::Error) }
    end
  end

  describe '#print' do
    let(:service) { described_class.new(object:) }
    subject { service.print }

    context 'with a string object' do
      let(:object) { 'my object' }

      it 'prints' do
        expect(Rails.logger).to receive(:info).with("Default prefix #{object} is printable!")
        subject
      end
    end

    context 'with a user' do
      let(:object) { create(:user) }

      it 'halts' do
        expect { subject }.to raise_error(described_class::Error, /object type is not handled/)
      end
    end
  end

  describe 'configuration.print_prefix' do
    before { GemTemplate.configuration.print_prefix = 'Custom prefix ' }

    it 'prints with prefix' do
      service = described_class.new(object: 'my object')
      expect(Rails.logger).to receive(:info).with('Custom prefix my object is printable!')
      service.print
    end
  end
end
