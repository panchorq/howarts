class PagesController < ApplicationController

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(params.require(:character).permit(:name, :location, :house))
    
    if @character.save
      redirect_to '/pages/index', notice: 'El registro se ha ingresado correctamente'
      else
        render :new, alert: 'Error, por favor intente nuevamente'      
    end
  end
  
end
