class BookmarksController < ApplicationController

# def show
#  @bookmark.list = List.find(params[:list_id])
# end

  def create
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.list = List.find(params[:list_id])
  # @bookmark.list = @list
  if @bookmark.save
    redirect_to list_path(@bookmark.list)
  else
    render 'list/show', status: :unprocessable_entity # throws a 422 (for Turbo)
  end
  end

  # ]:3000/lists/5
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
  end
end
