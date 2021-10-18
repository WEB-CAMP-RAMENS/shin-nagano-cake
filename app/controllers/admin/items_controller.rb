class Admin::ItemsController < ApplicationController
  def index
    
  end
  
  def show
  
  end
  
  def new
     @item = ITEM.new
  end
  
  def create
     @item = ITEM.new(item_params)
  end
  
  def edit
  
  end
  
  def update
    
  end
  def book_params
    params.require(:item).permit(:neme, :introduction,)
  end
end
