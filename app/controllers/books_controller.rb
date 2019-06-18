class BooksController < ApplicationController
  before_action :load_book, only: :show

  def index
    @books =
      Book.name_like(params[:search]).newest.paginate page: params[:page],
        per_page: Settings.book.per_page
  end

  def show; end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "messenger.no_data"
    render :index
  end
end
