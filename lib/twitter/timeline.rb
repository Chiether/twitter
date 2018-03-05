module Twitter
  class Timeline < Twitter::Base
    include Equalizer.new(:timeline_id)
    # @return [String]
    attr_reader :name, :collection_url, :custom_timeline_url, :description, :url,
                :visibility, :timeline_order, :collection_type, :custom_timeline_type
    # @return [Integer]
    attr_reader :user_id
    # @return [String] It's not Identity(:id)
    attr_reader :timeline_id
  end
end
