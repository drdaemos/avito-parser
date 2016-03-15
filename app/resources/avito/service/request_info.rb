require "addressable/uri"
require 'digest'

module Avito::Service
  class RequestInfo
    attr_reader :payload
    @@key = "XcyLEIoAuUgGSJUDFAs4xWTnV2TKEmvZTZuTtPFr"
    @@secret = "LLI1/E9&zfG-wwKTRd[XGFOAH~u.pnEJ{q(=oyAG"
    @@deviceId = "7999cdd6069e5cb"

    def initialize(payload, api, path, params)
      @payload = {
        "reducedParams" => true,
        "includeRefs" => 1,
        "deviceId" => @@deviceId,
        "page" => 1,
        "limit" => 30
      }
      @payload.merge!(payload)
      @path = path
      @params = params
      @api = api
      @payload['checksum'] = get_checksum
      @payload['key'] = @@key
    end

    def get_path
      return @api.to_s + sprintf(@path, @params)
    end

    private

    def get_query
      uri = Addressable::URI.new
      uri.query_values = @payload

      return uri.query
    end

    def get_checksum
      path = sprintf(@path, @params)
      sum = get_hash(@@secret) + get_hash(path) + get_hash(get_query)

      return get_hash(sum)
    end

    def get_hash(input)
      md5 = Digest::MD5.new
      md5 << input

      return md5.hexdigest
    end

  end
end