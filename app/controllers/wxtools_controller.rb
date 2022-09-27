class WxtoolsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource
   
  def index
    @wxtool = Wxtool.new
    @wxtools = Wxtool.all.page( params[:page]).per( Setting.systems.per_page )
  end

  def new
    @wxtool = Wxtool.new
  end
   
  def create
    @wxtool = Wxtool.new(wxtool_params)
     
    if @wxtool.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   
  def edit
    @wxtool = Wxtool.find(iddecode(params[:id]))
  end
   
  def update
    @wxtool = Wxtool.find(iddecode(params[:id]))
   
    if @wxtool.update(wxtool_params)
      redirect_to edit_wxtool_path(idencode(@wxtool.id)) 
    else
      render :edit
    end
  end
   
  def destroy
    @wxtool = Wxtool.find(iddecode(params[:id]))
   
    @wxtool.destroy
    redirect_to :action => :index
  end
   

  private
    def wxtool_params
      params.require(:wxtool).permit( :name, :link, :secd_id, :desc)
    end
  
  
  
end

