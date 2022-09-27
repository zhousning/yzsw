class ArticlesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource

   
  def index
    @articles = Article.order('pdt_date DESC').all.page( params[:page]).per( Setting.systems.per_page )
  end

  def show
    @article = Article.find(iddecode(params[:id]))
  end
   
  def new
    @article = Article.new
  end
   
  def create
    @secd = Secd.find(iddecode(params[:device]))
    @article = Article.new(article_params)
    @article.secd = @secd
     
    if @article.save
      redirect_to edit_article_path(idencode(@article.id)) 
    else
      render :new
    end
  end
   
  def edit
    @article = Article.find(iddecode(params[:id]))
  end
   
  def update
    @secd = Secd.find(iddecode(params[:device]))
    @article = Article.find(iddecode(params[:id]))
    @article.secd = @secd
   
    if @article.update(article_params)
      redirect_to edit_article_path(idencode(@article.id)) 
    else
      render :edit
    end
  end
   
  def destroy
    @article = Article.find(iddecode(params[:id]))
    @article.destroy
    redirect_to :action => :index
  end

  def download_attachment 
    @article = Article.find(iddecode(params[:id]))
    @attachment_id = params[:number].to_i
    @attachment = @article.attachments[@attachment_id]

    if @attachment
      send_file File.join(Rails.root, "public", URI.decode(@attachment.file_url)), :type => "application/force-download", :x_sendfile=>true
    end
  end
  
  

  private
    def article_params
      params.require(:article).permit( :title, :pdt_date, :content , attachments_attributes: attachment_params)
    end
  
  
    def attachment_params
      [:id, :file, :_destroy]
    end
  
  
end

