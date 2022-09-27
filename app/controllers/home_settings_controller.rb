class HomeSettingsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @home_settings = HomeSetting.all.page( params[:page]).per( Setting.systems.per_page )
   
  end
   
   
  #def new
  #  @secds = Secd.all
  #  @home_setting = HomeSetting.new
  #  
  #end
  # 

  # 
  #def create
  #  @home_setting = HomeSetting.new(home_setting_params)
  #   
  #  if @home_setting.save
  #    redirect_to :action => :index
  #  else
  #    render :new
  #  end
  #end
   

   
  def edit
   
    @secds = Secd.all
    @home_setting = HomeSetting.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @home_setting = HomeSetting.find(iddecode(params[:id]))
   
    if @home_setting.update(home_setting_params)
      redirect_to edit_home_setting_path(idencode(@home_setting.id)) 
    else
      render :edit
    end
  end
   

   
  #def destroy
  # 
  #  @home_setting = HomeSetting.find(iddecode(params[:id]))
  # 
  #  @home_setting.destroy
  #  redirect_to :action => :index
  #end
   

  
  private
    def home_setting_params
      params.require(:home_setting).permit( :diyi, :dangjian, :dier, :disan , :logo , :avatar , :photo , enclosures_attributes: enclosure_params)
    end
  
    def enclosure_params
      [:id, :file, :_destroy]
    end
  
  
  
end

