class DebugController < ApplicationController
  def index
  	id = params[:id] || '659859168'
    response = AvitoApi.new.get_item_by_id(id, Hash.new)
  	@data = {'response' => response, 'input' => id}
  end
end
