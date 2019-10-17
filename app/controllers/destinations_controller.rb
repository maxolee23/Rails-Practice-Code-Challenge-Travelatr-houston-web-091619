class DestinationsController < ApplicationController
    before_action :current_destination, only: [:show, :edit, :update]
    def index
        @destinations = Destination.all 
    end
    
    def new
    
    end
    
    def create
    
    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def show
        @age = @destination.bloggers.map{ |i| i.age }.reduce(:+) / @destination.bloggers.size
        @posts = @destination.posts.last(5)
    end
    
    def destroy
    
    end

    private 

    def current_destination
        @destination = Destination.find(params[:id])
    end
end
