require_relative './concerns/use_case'

class ShowItem
  include UseCase

  def initialize(id)
    @id = id
  end

  def perform
    api = AvitoApi.new
    item = api.get_item_by_id(@id, Hash.new)

    return item
  end
end