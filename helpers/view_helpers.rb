module Sinatra
  # a few helpers for keys, etc.
  module ViewHelpers
    def eve_keys
      if @data['eveapi']['result'].keys.include?('totals')
        return  @data['eveapi']['result']['rowset'].first['columns'].split(',')
      end
      @data['eveapi']['result']['rowset']['columns'].split(',')
    end

    def eve_rows
      if @data['eveapi']['result'].keys.include?('totals')
        data = @data['eveapi']['result']['rowset'].map { |a| a['row'] }
        return data.compact.flatten
      end
      @data['eveapi']['result']['rowset']['row']
    end
  end
end
