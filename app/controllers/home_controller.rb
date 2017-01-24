class HomeController < ApplicationController
  def index
    @bigmain = Bigmain.last
    @smallmain = Smallmain.last
    @news = New.paginate(:page => params[:page], per_page: 5).order('created_at DESC')
  end
  def qna_upload
     @qna = Qna.new
     @qna.name = params[:inquire_name]
     @qna.phone = params[:inquire_phone]
     @qna.email = params[:inquire_email]
     file = params[:inquire_pic]
     uploader = CutterUploader.new
     uploader.store!(file)
     @qna.qna_pic = uploader.url
     @qna.title = params[:inquire_title]
     @qna.content = params[:inquire_content]
     @qna.save
     redirect_to "/home/index"
  end
  def store_upload
    @store = Store.new
    @store.name = params[:name]
    @store.name_c = params[:name_c]
    @store.address = params[:address]
    @store.address_c = params[:address_c]
    @store.phone = params[:phone]
    @store.name = params[:name]
    file = params[:pic]
    uploader = CutterUploader.new
    uploader.store!(file)
    @store.photo = uploader.url
    @store.weekday = params[:weekday]
    @store.weekend = params[:weekend]
    @store.holiday = params[:holiday]
    @store.save
     redirect_to "/home/index"
  end
  def store_edit_com
    @store = Store.find(params[:id])
    @store.name = params[:name]
    @store.name_c = params[:name_c]
    @store.address = params[:address]
    @store.address_c = params[:address_c]
    @store.phone = params[:phone]
    @store.name = params[:name]
    @store.photo = params[:pic]
    @store.weekday = params[:weekday]
    @store.weekend = params[:weekend]
    @store.holiday = params[:holiday]
    @store.save
     redirect_to "/home/index"
  end
  def event_upload
    @event = Event.new
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    file = params[:pic]
    uploader = CutterUploader.new
    uploader.store!(file)
    @event.event_pic = uploader.url
    @event.save
     redirect_to "/home/index"
  end
  def event_edit_com
    @event = Event.find(params[:id])
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    @event.event_pic = params[:pic]
    @event.save
    redirect_to "/home/index"
  end
  def news_upload
    @event = New.new
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    file = params[:pic]
    @uploader = CutterUploader.new
    @uploader.store!(file)
    @event.news_pic = @uploader.url
    @event.save
    redirect_to "/home/news_detail/#{@event.id}"
  end
  def news_edit_com
    @event = New.find(params[:id])
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    @event.news_pic = params[:pic]
    @event.save
    redirect_to "/home/news_detail/#{@event.id}"
  end
  def news
    @news = New.paginate(:page => params[:page], per_page: 10)
    @news = @news.order('created_at DESC')
  end
  def event
    @event = Event.paginate(:page => params[:page], per_page: 10)
    @event = @event.order('created_at DESC')
  end
  def store
    @store = Store.all
  end
  def news_detail 
    @news = New.find(params[:id])
    @news.increment('count')
    @news.save
  end
  def news_edit 
    @news = New.find(params[:id])
  end
  def admin_qna_detail
    @qna = Qna.find(params[:id])
  end 
  def event_detail
    @event = Event.find(params[:id])
    @event.increment('count')
    @event.save
  end
  def event_edit
    @event = Event.find(params[:id])
  end
  def store_detail
    @store = Store.find(params[:id])
    @stores = Store.all
  end
  def store_edit
    @store = Store.find(params[:id])
  end
  def big_pic_upload
    @pic = Bigmain.new
    @pic.title = params[:title]
    file1 = params[:pic1]
    uploader1 = CutterUploader.new
    uploader1.store!(file1)
    @pic.pic1 = uploader1.url
    file1 = params[:pic2]
    uploader2 = CutterUploader.new
    uploader2.store!(file1)
    @pic.pic2 = uploader2.url
    file1 = params[:pic3]
    uploader3 = CutterUploader.new
    uploader3.store!(file1)
    @pic.pic3 = uploader3.url
    @pic.save
    redirect_to "/home/admin"
  end
  def bigmain_destroy 
    @bigmain = Bigmain.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin"
  end
  def smallmain_destroy 
    @bigmain = Smallmain.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin"
  end
  def news_destroy 
    @bigmain = New.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin"
  end
  def event_destroy 
    @bigmain = Event.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin"
  end
  def qna_destroy 
    @bigmain = Qna.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin"
  end
  def store_destroy 
    @bigmain = Store.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin"
  end
  def posts_destroy 
    @bigmain = Post.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin"
  end
  def small_pic_upload
    @pic = Smallmain.new
    @pic.title = params[:title]
    file1 = params[:pic1]
    uploader1 = CutterUploader.new
    uploader1.store!(file1)
    @pic.pic1 = uploader1.url
    file2 = params[:pic2]
    uploader2 = CutterUploader.new
    uploader2.store!(file2)
    @pic.pic2 = uploader2.url
    file3 = params[:pic3]
    uploader3 = CutterUploader.new
    uploader3.store!(file3)
    @pic.pic3 = uploader3.url
    file4 = params[:pic4]
    uploader4 = CutterUploader.new
    uploader4.store!(file4)
    @pic.pic4 = uploader4.url
    @pic.save
    redirect_to "/home/admin"
  end
  def admin_mainpage 
    @bigmain = Bigmain.paginate(:page => params[:page], per_page: 16).order('created_at DESC')
    @small = Smallmain.paginate(:page => params[:page], per_page: 16).order('created_at DESC')
  end
  def admin_catalog 
    @bigmain = Post.paginate(:page => params[:page], per_page: 16).order('created_at DESC')
  end
  def admin_news
    @news = New.paginate(:page => params[:page], per_page: 16).order('created_at DESC')
  end
  def admin_store
    @news = Store.paginate(:page => params[:page], per_page: 16).order('created_at DESC')
  end
  def admin_inquire 
    @news = Qna.paginate(:page => params[:page], per_page: 16).order('created_at DESC')
  end
  def admin_event
    @news = Event.paginate(:page => params[:page], per_page: 16).order('created_at DESC')
  end
  def write_cata
  end
  def ck
     @page = Page.new
  end
  def uppic 
     file = params[:picture]
     uploader = CutterUploader.new
     uploader.store!(file)

      czero = One.find(current_user.one.id)
      #@zero.pic_url = uploader.url
      czero.abc = uploader.url
      czero.efg = uploader.thumb.url
      if uploader == nil?
        flash[:alert] = "You haz errors!"
      else
        czero.save
        redirect_to "/home/one_edit/#{czero.id}"
      end
  end
end
