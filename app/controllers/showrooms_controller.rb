class ShowroomsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @showroom = Showroom.new
   
    @showrooms = Showroom.order('sequence').all.page( params[:page]).per( Setting.systems.per_page )
   
  end


   
  def new
    @showroom = Showroom.new
  end
   

   
  def create
    @showroom = Showroom.new(showroom_params)
     
    if @showroom.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   

   
  def edit
   
    @showroom = Showroom.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @showroom = Showroom.find(iddecode(params[:id]))
   
    if @showroom.update(showroom_params)
      #redirect_to showroom_path(idencode(@showroom.id)) 
      redirect_to :action => :index
    else
      render :edit
    end
  end
   

   
  def destroy
   
    @showroom = Showroom.find(iddecode(params[:id]))
   
    @showroom.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def showroom_params
      params.require(:showroom).permit( :title, :sequence , :photo)
    end
  
  
  
end

