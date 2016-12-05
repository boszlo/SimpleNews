class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search params[:q]
      if(@articles.size > 0)
        flash.now[:notice] = "#{@articles.size} results found for '#{params[:q]}'"
      else
        flash.now[:error] = "No results found for '#{params[:q]}'"
      end
    end
  end
end
