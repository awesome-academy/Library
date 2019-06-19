class StaticPagesController < ApplicationController
  def home
    @books =
      Book.name_like(params[:search]).newest.paginate page: params[:page],
        per_page: Settings.book.per_page
  end
end
