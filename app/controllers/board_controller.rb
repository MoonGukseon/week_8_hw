class BoardController < ApplicationController
    before_action :require_login, only: [:new, :edit]
    
    def index
        @post_list = Post.all
        if user_signed_in?
           @user_email = current_user.email
        end
    end
    
    def new
    end
    
    def create
        uploader = AvatarUploader.new
        uploader.store!(params[:image_url])
        
        post = Post.new
        post.title = params[:title]
        post.editor = params[:editor]
        post.content = params[:content]
        post.image_url = uploader
        post.save
        
        redirect_to "/index"
    end
    
    def show
        @id = params[:post_id]
        @post = Post.find(@id)
        
    end
    
    def edit
        @edit_id = params[:edit_id]
        @edit_post = Post.find(@edit_id)
    end
    
    def update
        uploader = AvatarUploader.new
        uploader.store!(params[:image_url])
        
        edit_id = params[:edit_id]
        edit_post = Post.find(edit_id)
        edit_post.title = params[:title]
        edit_post.editor = params[:editor]
        edit_post.content = params[:content]
        edit_post.image_url = uploader
        edit_post.save
        redirect_to "/index"
    end
    
    def delete
        delete_id = params[:delete_id]
        delete_post = Post.find(delete_id)
        delete_post.destroy
        redirect_to "/index"
    end
end
