class PostsController < ApplicationController
    before_action :current_post, only: [:show, :like]
    def index
        
    end
    
    def new
        @post = Post.new
        @bloggers = Blogger.all 
        @destinations = Destination.all 
    end
    
    def create
        @post = Post.new(post_params)

        if @post.valid? 
            @post.likes = 0
            @post.save 
            redirect_to @post 

        else 
            flash[:error] = @post.errors.full_messages 
            redirect_to new_post_path 
        end
    
    end

    def like 
        @post.likes += 1 
        @post.save 
        redirect_to @post 
    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def show
    
    end
    
    def destroy
    
    end

    private 

    def current_post 
        @post = Post.find(params[:id])
    end 
    
    def post_params 
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
 end
