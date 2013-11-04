class TadpolesController < ApplicationController

  def index
    @tadpoles = Tadpole.all
  end

  def new
    @frog = Frog.find(params[:id])
    @tadpole = Tadpole.new
  end

  def create
    Tadpole.create(params.require(:tadpole).permit(:name, :color, :frog_id))
    
    redirect_to(tadpoles_path)
  end

  def show
    @tadpole = Tadpole.find(params[:id])
  end

  def edit
    @tadpole = Tadpole.find(params[:id])
  end

  def update
    @tadpole = Tadpole.find(params[:id])
    @tadpole.update_attributes(params.require(:tadpole).permit(:name, :color, :frog_id))

    redirect_to(tadpoles_path)
  end

  def destroy
    @tadpole = Tadpole.find(params[:id])
    @tadpole.destroy

    redirect_to(tadpoles_path)
  end
  
  def evolve
    @tadpole = Tadpole.find(params[:id])
    new_frog = Frog.create(:name => @tadpole.name,
                :pond => @tadpole.frog.pond,
                :color => @tadpole.color
    )
    @tadpole.destroy

    redirect_to(tadpoles_path)
  end
end
