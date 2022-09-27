class PositionsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @position = Position.new
   
    @positions = Position.all
   
  end
   

  def create
    @position = Position.new(position_params)
     
    if @position.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   

   
  def edit
   
    @position = Position.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @position = Position.find(iddecode(params[:id]))
   
    if @position.update(position_params)
      redirect_to edit_position_path(idencode(@position.id)) 
    else
      render :edit
    end
  end
   

   
  def destroy
   
    @position = Position.find(iddecode(params[:id]))
   
    @position.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def position_params
      params.require(:position).permit( :title, :content, :lnt, :lat, :center_lnt, :center_lat, :des1, :des2, :des3 , :photo)
    end
  
  
  
end

