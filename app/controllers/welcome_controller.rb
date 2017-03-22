class WelcomeController < ApplicationController
  before_action :require_user
  def index
    # if current_user.admin?
    @items = Item.all
    # else
    #   @items = current_user.todo_lists(@items)
    # end
  end


end
