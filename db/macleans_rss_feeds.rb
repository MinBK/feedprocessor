class MacleansRssFeeds < ActiveRecord::Migration
  def self.up
    create_table  :macleans_rss_feeds do |t|
      t.string :url
      t.text :data
    end
  end

  def self.down
    drop_table :macleans_rss_feeds
  end
end