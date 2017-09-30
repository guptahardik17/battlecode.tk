#!/bin/usr/env ruby

#require 'cgi'
#require 'securerandom'
require 'dbi'

=begin
def generateCode()
    q = SecureRandom.hex
    pos = Random.new.rand(q.length-4)
    return q[pos...pos+4].swapcase
end

cgi = CGI.new
puts cgi.header
a = generateCode()

puts "<html><head>#{a}<head><html>"
=end

begin
   dbh = DBI.connect("DBI:MySql:flipfxfj_battlecode:localhost:3306", "", "")
   row = dbh.select_one("SELECT VERSION()")
   puts "Server version: " + row[0]
rescue DBI::DatabaseError => e
   puts "An error occurred"
   puts "Error code:    #{e.err}"
   puts "Error message: #{e.errstr}"
ensure
   dbh.disconnect if dbh
end