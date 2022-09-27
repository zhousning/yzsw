class ShuttersController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @shutter = Shutter.new
   
    @shutters = Shutter.all.order('sequence')
   
  end
   

   
  def create
    @shutter = Shutter.new(shutter_params)
     
    if @shutter.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   

   
  def edit
   
    @shutter = Shutter.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @shutter = Shutter.find(iddecode(params[:id]))
   
    if @shutter.update(shutter_params)
      redirect_to :action => :index
    else
      render :edit
    end
  end
   

   
  def destroy
   
    @shutter = Shutter.find(iddecode(params[:id]))
   
    @shutter.destroy
    redirect_to :action => :index
  end
   

  private
    def shutter_params
      params.require(:shutter).permit( :title, :link, :sequence , :photo)
    end
  
  
  
end

