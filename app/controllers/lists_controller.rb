class ListsController < ApplicationController
  before_action :set_list, only: %i[show create]
  def index
    # raise
    @lists = List.all
  end

  def show
    # raise
    # @bookmarks = Bookmark.all
    @bookmarks = @list.bookmarks
  end

  def new
    @lists = List.new
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end
end
