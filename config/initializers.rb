require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: './scrapper_devel.sqlite')
require_relative '../scrapper'
require_relative '../macleans_rss_feed'



