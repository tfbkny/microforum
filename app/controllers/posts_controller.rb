class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]



  # GET /posts
  # GET /posts.json
  def index
    # we sort posts alphabetically in Ascending order by topic (thanks Jaden for the joins guidance/code!)
    # also sorting by creation date in Descending order.

    @posts = Post.all.joins(:topic).order("topics.title ASC").order("created_at DESC")
    #@topic_by_title = Topic.order(title: :asc)
    #@posts = Post.all.order("#{@topic_by_title} ASC").order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = Post.new(post_params)
    #changed code so that when user is logged in, the post is connected to current_user
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
      params.require(:post).permit(:topic_id, :content, :votes) #removed :user_id param since we're using current_user and won't need it as a post param
    end

    def authorize
      if current_user.nil?
        redirect_to login_url, alert: "Not authorized! Please log in."
      else
        if @post && @post.user != current_user
          redirect_to root_path, alert: "Not authorized! Only #{@post.user} has access to this post."
        end
      end
    end

end
