class FetchItem
  include UseCase

  def initialize(id)
    @id = id
  end

  def perform
    api = Avito::Api.new
    @result = api.get_item_by_id(@id, Hash.new)
  end
end