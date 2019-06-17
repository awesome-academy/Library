module BooksHelper
  def load_categories_selectbox
    @category.map{|u| [u.name, u.id]}
  end
end
