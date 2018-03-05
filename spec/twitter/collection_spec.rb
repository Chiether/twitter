require 'helper'

describe Twitter::Collection do
  describe '.new' do
    subject{ described_class.new(objects, response) }
    let(:objects) do
      {
          timelines: {
              :'timeline-1' => {},
              :'timeline-2' => {}
          }
      }
    end
    let(:response) do
      {
          results: [{timeline_id: 'timeline-1'}, {timeline_id: 'timeline-2'}],
          cursors: {next_cursor: 'cursor'}
      }
    end
    it{ expect(subject.timelines).to all be_is_a Twitter::Timeline }
    it{ expect(subject.cursor).to be_is_a Twitter::Collection::Cursor }
  end
end
