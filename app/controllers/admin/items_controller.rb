class Admin::ItemsController < ApplicationController
  def index
     @items = Item.all
  end

  def show

  end

  def new
     @item = Item.new
  end

  def create
     @item = Item.new(item_params)
  end

  def edit

  end

  def update

  end

  private
   
  def item_params
    params.require(:item).permit(:neme, :introduction, :image)
  end
end
