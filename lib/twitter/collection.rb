require 'twitter/timeline'

module Twitter
  class Collection
    # @return [Twitter::Collection::Cursor]
    attr_reader :cursor
    # @return [Twitter::Timeline]
    attr_reader :timelines

    def initialize(objects, response)
      timeline_ids = response[:results].collect { |result| result[:timeline_id] }
      @timelines = timeline_ids.collect do |timeline_id|
        attrs = objects[:timelines][timeline_id.to_sym]
        Timeline.new(attrs.merge(timeline_id: timeline_id))
      end
      @cursor = Cursor.new(response[:cursors])
    end

    class Cursor < Twitter::Base
      # @return [Twitter::Timeline]
      attr_reader :next_cursor
    end
  end
end
