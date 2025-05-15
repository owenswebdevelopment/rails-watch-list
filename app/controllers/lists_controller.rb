class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new # I can put this in the index and move the form in the index show page
    # you would have to render index in create
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    # to create the instance from the form data
    @list = List.new(list_params)
    if @list.save
      # when it saves -> go to the restaurants show page
      redirect_to lists_path(@list)
    else
      # @lists = List.all add this if you put List.new in index
      # when it doesnt save -> show the form again
      render 'new', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end

  private

  def list_params
    # Strong params -> white listing the attributes users can give us in the form
    params.require(:list).permit(:name)
  end
end
