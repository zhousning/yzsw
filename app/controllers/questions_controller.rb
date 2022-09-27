class QuestionsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @questions = Question.order('created_at DESC').page( params[:page]).per( Setting.systems.per_page )
  end
   

  def edit
    @question = Question.find(iddecode(params[:id]))
  end
   

   
  def update
   
    @question = Question.find(iddecode(params[:id]))
   
    if @question.update(question_params)
      redirect_to edit_question_path(idencode(@question.id)) 
    else
      render :edit
    end
  end

   
  def destroy
   
    @question = Question.find(iddecode(params[:id]))
   
    @question.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def question_params
      params.require(:question).permit( :title, :content , enclosures_attributes: enclosure_params, answers_attributes: answer_params)
    end
  
    def enclosure_params
      [:id, :file, :_destroy]
    end
  
  
  
    def answer_params
      [:id, :content ,:_destroy]
    end
  
end

