class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path, notice: 'Author was successfully added.'
    else
      redirect_to new_authors_path, errors: @author.errors.full_messages
    end
  end

  private

  def author_params
    params.require(:author).permit(:id, :name)
  end
end