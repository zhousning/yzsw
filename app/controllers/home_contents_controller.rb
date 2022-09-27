class HomeContentsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource

   
  #def index
  #  @home_contents = HomeContent.all.page( params[:page]).per( Setting.systems.per_page )
  # 
  #end
   
   
  #def show
  # 
  #  @home_content = HomeContent.find(iddecode(params[:id]))
  # 
  #end
  # 

  # 
  #def new
  #  @home_content = HomeContent.new
  #  
  #end
  # 

  # 
  #def create
  #  @home_content = HomeContent.new(home_content_params)
  #   
  #  if @home_content.save
  #    redirect_to :action => :index
  #  else
  #    render :new
  #  end
  #end
   

   
  def edit
   
    @home_content = HomeContent.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @home_content = HomeContent.find(iddecode(params[:id]))
   
    if @home_content.update(home_content_params)
      redirect_to edit_home_content_path(idencode(@home_content.id)) 
    else
      render :edit
    end
  end
   

   
  #def destroy
  # 
  #  @home_content = HomeContent.find(iddecode(params[:id]))
  # 
  #  @home_content.destroy
  #  redirect_to :action => :index
  #end
   

  
  #def download_attachment 
  # 
  #  @home_content = HomeContent.find(iddecode(params[:id]))
  # 
  #  @attachment_id = params[:number].to_i
  #  @attachment = @home_content.attachments[@attachment_id]

  #  if @attachment
  #    send_file File.join(Rails.root, "public", URI.decode(@attachment.file_url)), :type => "application/force-download", :x_sendfile=>true
  #  end
  #end
  #

  #
  #def download_append
  # 
  #  @home_content = HomeContent.find(iddecode(params[:id]))
  # 
  #  @video = @home_content.video_url

  #  if @video
  #    send_file File.join(Rails.root, "public", URI.decode(@video)), :type => "application/force-download", :x_sendfile=>true
  #  end
  #end
  
  

  private
    def home_content_params
      params.require(:home_content).permit( :dtevent, :dtlink, :desc1, :desc2 , :by1 , :by2 , :by3 , :by4 , :by5 , :by6 , :video , :video_title, attachments_attributes: attachment_params , enclosures_attributes: enclosure_params)
    end
  
    def enclosure_params
      [:id, :file, :_destroy]
    end
  
  
    def attachment_params
      [:id, :file, :_destroy]
    end
  
  
end

