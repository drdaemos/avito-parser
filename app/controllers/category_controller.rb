class CategoryController < ApplicationController
  def index
    result = FetchCategories.perform()
  end
end
