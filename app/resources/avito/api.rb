require 'unirest'

module Avito
	class Api
		@@endpoint = "http://www.avito.ru/api/"

		attr_reader :last_request
		def initialize()
			@last_request = nil
		end

		def get_items(params)
			info = Service::RequestInfo.new(params, 4, '/items', Hash.new)
			object = perform_request(info)

			return object
		end

		def get_item_by_id(id, params)
			info = Service::RequestInfo.new(params, 3, '/items/%{id}', {:id => id})
			object = perform_request(info)

			return object
		end

		def get_categories(params)
			info = Service::RequestInfo.new(params, 3, '/categories', Hash.new)
			object = perform_request(info)

			return object
		end

		def get_category_by_id(id, params)
			info = Service::RequestInfo.new(params, 3, '/categories/%{id}', {:id => id})
			object = perform_request(info)

			return object
		end

		def get_category_search_params(id, params)
			info = Service::RequestInfo.new(params, 2, '/categories/%{id}/params/search', {:id => id})
			object = perform_request(info)

			return object
		end

		private

		def perform_request(info)
			@last_request = info

     		ap info.payload
			response = Unirest.get @@endpoint + info.get_path,
								   headers:{ "Accept" => "application/json" },
			 					   parameters: info.payload

			return response.body
		end
	end
end