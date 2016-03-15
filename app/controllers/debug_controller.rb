require 'awesome_print'

class DebugController < ApplicationController
  def item
  	id = params[:id] || '659859168'
    response = FetchItem.perform(id)
  	@data = {'response' => response, 'input' => id}

    render json: response
  end

  def items
    category_id = params[:categoryId] || nil
    response = FetchItems.perform(category_id)
    @data = {'response' => response, 'input' => category_id}

    render json: response
  end

  def search_params
    id = params[:id] || '9'
    response = FetchParams.perform(id)
    @data = {'response' => response, 'input' => id}

    render json: response
  end

  def categories
    response = FetchCategories.perform()
  	@data = {'response' => response, 'input' => nil}

    render json: response
  end

  def category
  	id = params[:id] || '9'
    response = FetchCategory.perform(id)
  	@data = {'response' => response, 'input' => id}

    render json: response
  end
end
