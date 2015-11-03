#!/usr/bin/ruby
require "addressable/uri"
require 'digest'
@uri = Addressable::URI.new

def getHash(input)
    md5 = Digest::MD5.new
    md5 << input
    
    return md5.hexdigest
end

@key = "XcyLEIoAuUgGSJUDFAs4xWTnV2TKEmvZTZuTtPFr"

@strangeString = "LLI1/E9&zfG-wwKTRd[XGFOAH~u.pnEJ{q(=oyAG"

@path = "/categories/9/params/search"

@queryparams = {
    "reducedParams" => true,
    "includeRefs" => 1,
    "deviceId" => "7999cdd6069e5cb"
}

@uri.query_values = @queryparams
puts @uri.query

sum = getHash(@strangeString) + getHash(@path) + getHash(@uri.query)

checksum = getHash(sum)

puts checksum