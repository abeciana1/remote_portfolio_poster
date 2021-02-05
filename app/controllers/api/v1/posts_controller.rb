class Api::V1::PostsController < ApplicationController
    
    def index
        posts = Post.all
        render :json => posts, each_serializer: PostSerializer
    end
    
    def show
        post = Post.find(params[:id])
        render :json => post, each_serializer: PostSerializer
    end
    
    def create
        post = Post.create(post_params)
        if post.valid?
            render json: {post: PostSerializer.new(post)}, status: :created
        else
            render json: => { error: "failed to create post"}, status: :not_acceptable
        end
    end
    
    
    def update
        post = Post.find(params[:id])
        post.update(post_params)
        render :json => post, each_serializer: PostSerializer
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: {}
    end
    
    private
    
    def post_params
        params.require(:post).permit(:content)
    end

end
