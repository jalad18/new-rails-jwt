class NewsController < ApplicationController 
    before_action :find_news, only: [:show, :edit, :update]
  
    def index
      @news = News.all
      render json: @news, status: :ok
    end
  
    def show
      render json: @news, status: :ok
    end
  
    def edit
    end
  
    def create
      @news = News.new(set_params)
  
      if @news.save
        render json: @news, status: :created
      else
        render json: { errors: @news.errors.full_messages },status: :unprocessable_entity
      end
    end
  
    def update
      unless @news.update(set_params)
        render json: { errors: @news.errors.full_messages },status: :unprocessable_entity
      end
    end

    def destroy
      @news.destroy
    end
  
    private
  
    def set_params
      params.require(:news).permit(:body, :title, :user_id)
    end
  
    def find_news
      @news = News.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'news not found' }, status: :not_found
    end
  end
  