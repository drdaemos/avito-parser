class FetchParams
  include UseCase

  def initialize(id)
    @id = id
  end

  def perform
    api = Avito::Api.new
    @result = api.get_category_search_params(@id, Hash.new)
  end
end