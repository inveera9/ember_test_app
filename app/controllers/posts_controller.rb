class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /posts
  # GET /posts.json
  load_and_authorize_resource
  def index
    @posts = Post.all
    respond_to do |format|
    
    format.json { render json: @posts }
  end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_to do |format|
    
    format.json { render json: @post}
  end
    authorize! :read, @post
  end

  # GET /posts/new
  def new

    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    unauthorized! if cannot? :edit, @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    unauthorized! if cannot? :create, @post
    
    respond_to do |format|
      if @post.save
        
        format.json { render :json=> @post ,status: 201}
      else
        
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        
        format.json { render  :json=> @post ,status: :ok }
      else
       
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
