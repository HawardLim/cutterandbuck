class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @post_last = Post.last
    if @post_last.nil? 
      @posts = Post.all
    else
      @post_last_attach = @post_last.post_attachments.paginate(:page => params[:page], per_page: 6)
      @post_last_attachs = @post_last_attach
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     @posts = Post.all
     @post =Post.find(params[:id])
     @post_attachments = @post.post_attachments.paginate(:page => params[:page], per_page: 6)
     @post_attachmentss = @post_attachments
  end

  # GET /posts/new
  def new
   @post = Post.new
   @post_attachment = @post.post_attachments.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
     @post = Post.new(post_params)

     respond_to do |format|
       if @post.save
         i = 0
         params[:post_attachments]['avatar'].each do |a|
            @post_attachment = @post.post_attachments.create
            @pic_count = @post.post_attachments.count
            file = a
            uploader = CutterUploader.new
            uploader.store!(file)
            @post_attachment.avatar = uploader.url
            #while ( i < @pic_count + 1 )
            @post_attachment.id_of_pic = i
            i+= 1
            #end
            if i > 5
              i = 0
            end
            @post_attachment.save
         end
         format.html { redirect_to @post, notice: 'Post was successfully created.' }
         else
         format.html { render action: 'new' }
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
      params.require(:post).permit(:title, post_attachments_attributes: [:id, :post_id, :avatar])
   end
end
