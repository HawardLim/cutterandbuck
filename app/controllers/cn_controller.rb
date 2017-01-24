class CnController < ApplicationController
  def index
    @bigmain = Bigmain.last
    @smallmain = Smallmain.last
    @news = New.paginate(:page => params[:page], per_page: 5).order('created_at DESC')
    render layout: "china"
  end
  def news
    @news = New.paginate(:page => params[:page], per_page: 10)
    @news = @news.order('created_at DESC')
    render layout: "china"
  end
  def event
    @event = Event.paginate(:page => params[:page], per_page: 10)
    @event = @event.order('created_at DESC')
    render layout: "china"
  end
  def brand
    render layout: "china"
  end 
  def company
    render layout: "china"
  end
  def contactus
    render layout: "china"
  end 
  def inquire
    render layout: "china"  
  end 
  def international
    render layout: "china"  
  end
  def store
    @store = Store.all
    render layout: "china"
  end
  def news_detail 
    @news = New.find(params[:id])
    @news.increment('count')
    @news.save
    render layout: "china"
  end
  def news_edit 
    @news = New.find(params[:id])
    render layout: "china"
  end
  def admin_qna_detail
    @qna = Qna.find(params[:id])
    render layout: "china"
  end 
  def event_detail
    @event = Event.find(params[:id])
    @event.increment('count')
    @event.save
    render layout: "china"
  end
  def store_detail
    @store = Store.find(params[:id])
    @stores = Store.all
    render layout: "china"
  end
  def catalog
    @post_last = Post.last
    if @post_last.nil? 
      @posts = Post.all
    else
      @post_last_attach = @post_last.post_attachments.paginate(:page => params[:page], per_page: 6)
      @post_last_attachs = @post_last_attach
      @posts = Post.all
    end
     render layout: "china"
  end

  # GET /posts/1
  # GET /posts/1.json
  def catalog_detail
     @posts = Post.all
     @post =Post.find(params[:id])
     @post_attachments = @post.post_attachments.paginate(:page => params[:page], per_page: 6)
     @post_attachmentss = @post_attachments
      render layout: "china"
  end
  def withcutterbuck
    render layout: "china"
  end
end
