require 'helper'

describe Twitter::Timeline do
  describe '#==' do
    subject{ timeline == other }
    let(:timeline){ described_class.new(timeline_id: 1, name: 'foo') }
    context 'when objects IDs are the same' do
      let(:other){ described_class.new(timeline_id: 1, name: 'foo') }
      it{ is_expected.to be_truthy }
    end
    context 'when objects IDs are different' do
      let(:other){ described_class.new(timeline_id: 2, name: 'bar') }
      it{ is_expected.to be_falsey }
    end
    context 'when when classes are different' do
      let(:other){ Twitter::Identity.new(id: 1) }
      it{ is_expected.to be_falsey }
    end
  end
end
