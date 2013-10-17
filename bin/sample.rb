#!/usr/bin/env ruby

require "rubygems"
require "json"
require 'msgpack'
require 'active_record'
require "arel"
require "PredicateLiteralKit4Ruby"
require "zlib"

require "cgi"

# Connect to the database
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :host => "localhost",
    :username => "user",
    :password => "pwd",
    :database => "test.db"
)

# Setup the engine for Arel
Arel::Table.engine = Arel::Sql::Engine.new(ActiveRecord::Base)


YESTERDAY = "abc123"

json_string = ARGF.read
puts "JSON String: #{json_string.size()}"
# puts json_string
# puts

compressed_json_string = Zlib::Deflate.deflate(json_string)
puts "Compressed JSON String: #{compressed_json_string.size()}"
# puts compressed_json_string
# puts

escaped_json_string = CGI.escape(json_string)
puts "Escaped JSON String: #{escaped_json_string.size()}"
# puts escaped_json_string
# puts

escaped_compressed_json_string = CGI.escape(compressed_json_string)
puts "Compressed Escaped JSON String: #{escaped_compressed_json_string.size()}"
# puts escaped_compressed_json_string
# puts


property_literals = JSON.parse(json_string)

msgpack_string = property_literals.to_msgpack()
puts "MsgPack String: #{msgpack_string.size()}"
# puts msgpack_string
# puts

compressed_msgpack_string = Zlib::Deflate.deflate(msgpack_string)
puts "Compressed MsgPack String: #{compressed_msgpack_string.size()}"
# puts compressed_msgpack_string
# puts

escaped_msgpack_string = CGI.escape(msgpack_string)
puts "Escaped MsgPack String: #{escaped_msgpack_string.size()}"
# puts escaped_msgpack_string
# puts

escaped_compressed_msgpack_string = CGI.escape(compressed_msgpack_string)
puts "Compressed Escaped MsgPack String: #{escaped_compressed_msgpack_string.size()}"
# puts escaped_compressed_msgpack_string
# puts

puts

predicate = PredicateLiteral.parse(property_literals)
table = Arel::Table.new(:user)

puts predicate.build_arel(table).to_sql
puts
