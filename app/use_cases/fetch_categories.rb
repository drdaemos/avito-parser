class FetchCategories
  include UseCase

  def initialize()
  end

  def perform
    api = Avito::Api.new
    @result = api.get_categories(Hash.new)
  end
end