class BookmarksController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.new
  end

  def create
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.category_id = @category.id
    @bookmark.save

    redirect_to category_path(@category)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    @category = Category.find(params[:category_id])

    redirect_to category_path(@category)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:recipe_id, :comment)
  end
end
