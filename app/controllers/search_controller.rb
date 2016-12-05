class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @articles = []
      @authors = []
    else
      @articles = Article.search params[:q]
      @authors = Author.search params[:q]
      if(@articles.size > 0 || @authors.size > 0)
        flash.now[:notice] = "#{@articles.size + @authors.size} results found for '#{params[:q]}'"
      else
        flash.now[:error] = "No results found for '#{params[:q]}'"
      end
    end
  end
end
