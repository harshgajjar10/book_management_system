module BooksHelper
  def order_authors_by_name
    Author.order(:name)
  end

  def order_categories_by_name
    Category.order(:name)
  end
end