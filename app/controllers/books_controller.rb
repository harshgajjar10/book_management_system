class BooksController < ApplicationController

  def index
    @books = Book.search(params[:name]).order('updated_at DESC')
    @favorite_books = current_user.favorited_by_type('Book')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book was successfully added.'
    else
      redirect_to new_books_path, errors: @book.errors.full_messages
    end
  end

  def toggle_favorite
    @book = Book.find(params[:id])
    message = "#{@book.name} was Liked"
    if current_user.favorited?(@book)
      current_user.unfavorite(@book)
      message = "#{@book.name} was Disliked"
    else
      current_user.favorite(@book)
    end
    redirect_to root_path, notice: message
  end

  private

  def book_params
    params.require(:book).permit(:id, :name, :description, :publish_at, :author_id, category_ids: [])
  end
end
