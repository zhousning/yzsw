class EnginesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def edit
   
    @engine = Engine.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @engine = Engine.find(iddecode(params[:id]))
   
    if @engine.update(engine_params)
      redirect_to edit_engine_path(idencode(@engine.id)) 
    else
      render :edit
    end
  end
   

  private
    def engine_params
      params.require(:engine).permit( :template, :consult, :point, :des1, :des2, :des3 , :logo)
    end
  
  
  
end

