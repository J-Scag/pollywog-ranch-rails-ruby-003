class PondsController < ApplicationController

  def index
    @ponds = Pond.all
  end

  def new
    @pond = Pond.new
  end

  def create
    Pond.create(params.require(:pond).permit(:name, :water_type))
    
    redirect_to(ponds_path)
  end

  def show
    @pond = Pond.find(params[:id])
  end

  def edit
    @pond = Pond.find(params[:id])
  end

  def update
    @pond = Pond.find(params[:id])
    @pond.update_attributes(params.require(:pond).permit(:name, :water_type))
    
    redirect_to(ponds_path)
  end

  def destroy
    @pond = Pond.find(params[:id])
    @pond.frogs.each do |f|
      f.tadpoles.each {|t| t.destroy }
      f.destroy
    end
    @pond.destroy
    
    redirect_to(ponds_path)
  end

end
