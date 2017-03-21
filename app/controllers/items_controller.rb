class ItemsController < ApplicationController
  before_action :require_user
  before_action :find_todolist_id

  def index
    @items = current_user.todo_lists(@items)

  end

  def show
    @photos = @item.photos
  end

  def new
     @item = @todo_list.items.new
  end

  def edit
    @item = @todo_list.items.find(params[:id])
    if current_user.id = @item

      @photos = @item.photos
    else
      redirect_to root_path, notice: "You don't have permission!"
    end
  end


  def create
    @item = @todo_list.items.new(item_params)
    # byebug
    if @item.save
      # byebug
      if params[:images]
        params[:images].each do |image|
          @item.photos.create(image: image)
          # byebug
        end
      end

      photos = @item.photos
      flash[:notice] = "new item added!"
      redirect_to '/'
    else
      flash[:info] = "Hey,There is a problem with your adding new item."
      render :new
    end
  end

  def update
    # @item = current_user.items.build(params[:id])
    @item = @todo_list.items.find(params[:id])
    if @item.update_attributes(item_params)
      if params[:images]
        params[:images].each do |image|
           @item.photos.create(image: image)
        end
      end

      flash[:notice] = "item Updated!"
      redirect_to '/'
      # redirect_to todo_list_item(@item)

    else
      flash[:notice] = "Could not Saved!"
      render :edit
    end
  end


  def destroy
    @item = @todo_list.items.find(params[:id])
    if @item.destroy
      flash[:success] = "Item was deleted!"
      # byebug
    else
      flash[:error] = "Item could not be deleted!"
    end
    redirect_to todo_list_items_path
  end

  def complete
    @item = @todo_list.items.find(params[:id])
    @item.update_attribute(:completed_at, Time.now.asctime)
    redirect_to todo_list_items_path, notice: "It's done!"
  end
end

private

def find_todolist_id
  # scope problem ,checked
  @todo_list = @current_user.todo_lists.find(params[:todo_list_id])
  
end

def item_params
  params.require(:item).permit(:content, :completed_at, :address, :latitude, :longitude, :todo_list_id)
end
