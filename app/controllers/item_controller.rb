class ItemController < ApplicationController
  def index
  	id = params[:id] || '0'
    result = FetchItem.perform(id)
  end
end
