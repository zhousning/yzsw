class AnswersController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource

   
  def index
    @answer = Answer.new
   
    #@answers = Answer.all.page( params[:page]).per( Setting.systems.per_page )
   
  end
   

  def query_all 
    items = Answer.all
   
    obj = []
    items.each do |item|
      obj << {
        #:factory => idencode(factory.id),
        :id => idencode(item.id),
       
        :content => item.content
      
      }
    end
    respond_to do |f|
      f.json{ render :json => obj.to_json}
    end
  end



   
  def show
   
    @answer = Answer.find(iddecode(params[:id]))
   
  end
   

   
  def new
    @answer = Answer.new
    
  end
   

   
  def create
    @answer = Answer.new(answer_params)
     
    if @answer.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   

   
  def edit
   
    @answer = Answer.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @answer = Answer.find(iddecode(params[:id]))
   
    if @answer.update(answer_params)
      redirect_to answer_path(idencode(@answer.id)) 
    else
      render :edit
    end
  end
   

   
  def destroy
   
    @answer = Answer.find(iddecode(params[:id]))
   
    @answer.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def answer_params
      params.require(:answer).permit( :content , enclosures_attributes: enclosure_params)
    end
  
    def enclosure_params
      [:id, :file, :_destroy]
    end
  
  
  
end

