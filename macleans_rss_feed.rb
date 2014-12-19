class MacleansRssFeed < ActiveRecord::Base
  serialize :data

  def jsonified_data
    self.data.to_json
  end
end