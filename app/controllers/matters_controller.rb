class MattersController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @matter = Matter.new
   
    @matters = Matter.order('sequence')
   
  end
   
   
  def new
    @matter = Matter.new
    
  end
   

   
  def create
    @matter = Matter.new(matter_params)
     
    if @matter.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   

   
  def edit
   
    @matter = Matter.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @matter = Matter.find(iddecode(params[:id]))
   
    if @matter.update(matter_params)
      redirect_to edit_matter_path(idencode(@matter.id)) 
    else
      render :edit
    end
  end
   

   
  def destroy
   
    @matter = Matter.find(iddecode(params[:id]))
   
    @matter.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def matter_params
      params.require(:matter).permit( :title, :background, :link, :sequence, :icon , :logo)
    end
  
  
  
end

