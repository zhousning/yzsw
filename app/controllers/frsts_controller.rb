class FrstsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @frsts = Frst.all.page( params[:page]).per( Setting.systems.per_page )
  end
   
  def query_device
    @frsts = Frst.all
    result = []
    @frsts.each do |frst|
      text = frst.name
      children = []
      frst.secds.each do |secd|
        children << {
          id: secd.id,
          text: secd.name
        }
      end
      result << {
        text: text,
        children: children
      }
    end
    obj = {
      "results": result
    }
    respond_to do |f|
      f.json{ render :json => obj.to_json}
    end
  end

   
  #def show
  #  @frst = Frst.find(iddecode(params[:id]))
  #end
   
  def new
    @frst = Frst.new
    @frst.secds.build
  end
   
  def create
    @frst = Frst.new(frst_params)
     
    if @frst.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   
  def edit
    @frst = Frst.find(iddecode(params[:id]))
  end
   
  def update
    @frst = Frst.find(iddecode(params[:id]))
   
    if @frst.update(frst_params)
      redirect_to edit_frst_path(idencode(@frst.id)) 
    else
      render :edit
    end
  end
   
  def destroy
    @frst = Frst.find(iddecode(params[:id]))
   
    @frst.destroy
    redirect_to :action => :index
  end
   

  private
    def frst_params
      params.require(:frst).permit( :name, :sequence, :index_page, :show_page , :sidebar , :header, secds_attributes: secd_params)
    end
  
  
  
    def secd_params
      [:id, :name, :sequence, :index_page, :show_page , :link, :showstyle, :header, :_destroy, :svg]
    end
  
end

