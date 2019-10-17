class BloggersController < ApplicationController
    before_action :current_blogger, only: [:show, :edit, :update, :destroy]
    def index
        @bloggers = Blogger.all 
    end

    
    def new
        @blogger = Blogger.new
    end
    
    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.valid?
            @blogger.save 
            redirect_to @blogger 
        else 
            flash[:error]= @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    
    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def show
        @likes = @blogger.posts.map{|i| i.likes }.reduce(:+)
    
    end
    
    def destroy
    
    end

    private 

    def current_blogger 
        @blogger = Blogger.find(params[:id])
    end 

    def blogger_params 
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
