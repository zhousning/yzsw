Rails.application.routes.draw do
  #root :to => 'controls#index'
  root :to => 'home#index'

  #mount Ckeditor::Engine => '/ckeditor'
  
  #devise_for :admin_users, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  
  #get 'forget', to: 'admin/dashboard#index'
  #devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :users, :path => 'nigexiaojiang', :skip => [ :passwords, :registrations, :confirmations], controllers: {  sessions: 'users/sessions' }
  devise_scope :user do
    #get 'forget', to: 'users/passwords#forget'
    #patch 'update_password', to: 'users/passwords#update_password'
    #post '/login_validate', to: 'users/sessions#user_validate'
    #
    #unauthenticated :user do
    #  root to: "devise/sessions#new",as: :unauthenticated_root #设定登录页为系统默认首页
    #end
    #authenticated :user do
    #  root to: "homes#index",as: :authenticated_root #设定系统登录后首页
    #end
  end

  #resources :users, :only => []  do
  #  get :center, :on => :collection
  #  get :alipay_return, :on => :collection
  #  post :alipay_notify, :on => :collection
  #  get :mobile_authc_new, :on => :member
  #  post :mobile_authc_create, :on => :member
  #  get :mobile_authc_status, :on => :member
  #end
  #resources :systems, :only => [] do
  #  get :send_confirm_code, :on => :collection
  #end


  #resources :roles

  resources :home do
    get :index0, :on => :collection
  end

  resources :spiders do
    get :start, :on => :member
  end

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/mysbcnmsidekiq'

  #模板
  resources :properties
  resources :nests 
  resources :domains 

  resources :templates do
    get :produce, :on => :member
  end

  resources :frsts, :except => [:show] do
    get :query_device, :on => :collection
  end

  resources :secds, :only => [] do
    resources :newspapers, :only => [] do
      get :list, :on => :collection
      get :info, :on => :member
      get :download_attachment, :on => :member
    end
  end
  resources :articles do
    get :download_attachment, :on => :member
  end

  resources :carousels, :except => [:show]
  resources :showrooms, :except => [:show]  
  resources :home_settings, :except => [:show] 
  resources :wxtools, :except => [:show]   
  resources :home_contents, :only => [:edit, :update] 

  resources :shutters 
  resources :questions do
    get :download_append, :on => :member
    get :query_all, :on => :collection
  end
  resources :answers
  resources :consults, :only => [:index, :create]
  resources :matters
  resources :engines do
    get :download_append, :on => :member
    get :query_all, :on => :collection
  end
  resources :positions do
    get :download_append, :on => :member
    get :query_all, :on => :collection
  end
  resources :flower

end
