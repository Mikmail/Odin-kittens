class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index 
    @kittens = Kitten.all 
  end

  def show;end

  def new 
    @kitten = Kitten.new 
  end 

  def edit;end 

  def destroy 
    @kitten.destroy 

    redirect_to root_path
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten 
    else 
      render :edit 
    end 
  end

  def create 
    @kitten = Kitten.new(kitten_params)
    
    if @kitten.save 
      redirect_to root_path 
    else 
      render :new 
    end 
  end

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  private 

  def kitten_params 
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end


end
