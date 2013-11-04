class FrogsController < ApplicationController

  def index
    @frogs = Frog.all
  end

  def new
    @ponds = Pond.all
    @frog = Frog.new
  end

  def create
    Frog.create(params.require(:frog).permit(:name, :color, :pond_id))
    
    redirect_to(frogs_path)
  end

  def show
    @frog = Frog.find(params[:id])
  end

  def edit
    @ponds = Pond.all
    @frog = Frog.find(params[:id])
  end

  def update
    @frog = Frog.find(params[:id])
    @frog.update_attributes(params.require(:frog).permit(:name, :color, :pond_id))
    
    redirect_to(frogs_path)
  end

  def destroy
    @frog = Frog.find(params[:id])
    @frog.tadpoles.each {|t| t.destroy }
    @frog.destroy
    
    redirect_to(frogs_path)
  end

end
