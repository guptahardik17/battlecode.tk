#!/usr/bin/ruby

require 'cgi'
begin
require 'securerandom'

def generateCode()
    q = SecureRandom.hex
    pos = Random.new.rand(q.length-4)
    return q[pos...pos+4].swapcase
end
end

cgi = CGI.new
puts cgi.header
a = generateCode()
#a = "6XCF"
puts "<html><body>"+a+"</body></html>"