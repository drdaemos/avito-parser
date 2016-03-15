require 'awesome_print'
class FetchItems
  include UseCase

  def initialize(category_id)
    @category_id = category_id
  end

  def perform
    api = Avito::Api.new
    params = { 'categoryId' => @category_id }
    @result = api.get_items(params)
  end
end