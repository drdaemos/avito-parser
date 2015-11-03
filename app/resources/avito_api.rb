require 'unirest'

class AvitoApi
	@@endpoint = "http://www.avito.ru/api/"

	attr_reader :last_request
	def initialize()
		@last_request = nil
	end

	def get_item_by_id(id, params)
		info = RequestInfo.new(params, 3, '/items/%{id}', {:id => id})
		@last_request = info
		object = perform_request(info)

		return object
	end

	private

	def perform_request(info)
		response = Unirest.get @@endpoint + info.get_path,
							   headers:{ "Accept" => "application/json" },
		 					   parameters: info.payload

		return response.body
	end
end