class MainController < ApplicationController
  def index
    
    ## 각 학교 소개 페이지로 넘어갈 버튼 만들기 ##
    #@univ_detail = Univ.all
    ## 혹시 학교 소개 랜덤으로 뿌릴거면 이걸로 뿌리면 됨 ##
    #@banner = @univ_detail.sample(3)
    #@post_question = PostQuestion.last(5)
    
    
    @current_user = User.find(session[:user_id]) unless session[:user_id].nil?
    
  end
  
  def search
    @user = User.all
    @board = Board.all
    @post = Post.all
    @comment = Comment.all
    @word = params[:word]
  end
  
  def my_portfolio #***----------------------------------------------------내 포트폴리오 페이지
    #//-------------------------------------------------------------------------페이지 전반에 현재 유저를 정의하고 정보 띄우기
    if session[:user_id].nil?
      redirect_to :back
      return
    end
    @current_user = User.find(session[:user_id]) #---로그인 된 경우 현재 유저를 정의
    @each_myprj = @current_user.myprj_eaches    #-----------------------------------정의된 유저에 종속된 "내 각각의 프로젝트"를 호출
    #@each_myprj = MyprjEach.where(:user_id => @current_user.id)
    
    #//-------------------------------------------------------------------------폴더 선택 & 선별해서 "보여주기" 기능
        if params[:category].nil? || params[:category] == "0"
            @each_myprj = @current_user.myprj_eaches
        else
            @each_myprj = @current_user.myprj_eaches.where(:prj_ctgory => params[:category])
        end
    
  end
  
  def prj_delete #***-----------------------------------------------------내 포트폴리오 삭제하는 페이지
    @one_prj = MyprjEach.find(params[:id])                               #버튼 누르면 접근하고 접근즉시 삭제. 후 복귀.
    @one_prj.delete
    
    redirect_to "/main/my_portfolio"
  end
  
  #def prj_dconfirm #***-------------------------------------프로젝트 삭제할때 비번 확인 받고 삭제할라고 앴는데 세션이 안돼서 탈락
  #  @one_prj = MyprjEach.find(params[:id])
  #  @user_email = User.find(params[:user_id]).user_email
  #  
  #  if session[:user_email] == params[:user_dmail]
  #     @one_prj.delete
  #  
  #    redirect_to '/main/my_portfolio'
  #  
  #  elsif "121234".to_s == params[:user_dpassword]
  #     @one_prj.delete
  #  
  #    redirect_to '/main/my_portfolio' 
  #  
  #  else
  #    redirect_to :back
  #  end
  #end
  
  def prj_modify
    @one_prj = MyprjEach.find(params[:id])
  end
  
  def add_portfolio
    if params[:confirm]=="1" #-----------------------------//포트폴리오에 프로젝트 추가하기
      aprj = MyprjEach.new
      aprj.user_id = params[:user_id]
      aprj.myprj_each_img = params[:myprj_each_img]
      aprj.prj_title = params[:prj_title]
      aprj.prj_memo = params[:prj_memo]
      aprj.prj_content = params[:prj_content]
      aprj.prj_url = params[:prj_url]
      aprj.prj_ctgory = params[:category]
      aprj.save
      redirect_to "/main/my_portfolio"
      
    elsif params[:confirm]=="2"  #-------------------------//기존의 프로젝트 수정하고 등록하기
      aprj = MyprjEach.find(params[:id])
      aprj.user_id = params[:user_id]
      aprj.myprj_each_img = params[:myprj_each_img]
      aprj.prj_title = params[:prj_title]
      aprj.prj_memo = params[:prj_memo]
      aprj.prj_content = params[:prj_content]
      aprj.prj_url = params[:prj_url]
      aprj.prj_ctgory = params[:category]
      aprj.save
      redirect_to "/main/my_portfolio"
      
    elsif params[:confirm]=="3"
    #//-------------------------------------------------------------------------폴더만 "버튼으로 수정하기" 기능
      @one_prj = MyprjEach.find(params[:id])
      
      aprj = MyprjEach.find(params[:id])
      aprj.user_id = @one_prj.user_id
      aprj.myprj_each_img = @one_prj.myprj_each_img
      aprj.prj_title = @one_prj.prj_title
      aprj.prj_memo = @one_prj.prj_memo
      aprj.prj_content = @one_prj.prj_content
      aprj.prj_url = @one_prj.prj_url
      aprj.prj_ctgory = params[:category] #이부분만 변경사항 받아서 수정하도록 했음. 파람스는 my_protfolio 페이지로부터.
      aprj.save
      redirect_to :back
      
    elsif params[:confirm]=="4"
    #//-------------------------------------------------------------------------"버튼눌러 ^공개로^ 수정하기" 기능
      @one_prj = MyprjEach.find(params[:id])
      
      aprj = MyprjEach.find(params[:id])
      aprj.user_id = @one_prj.user_id
      aprj.myprj_each_img = @one_prj.myprj_each_img
      aprj.prj_title = @one_prj.prj_title
      aprj.prj_memo = @one_prj.prj_memo
      aprj.prj_content = @one_prj.prj_content
      aprj.prj_url = @one_prj.prj_url
      aprj.prj_ctgory = @one_prj.prj_ctgory
      aprj.lookable = 1 #// 1=공개. 공개프로젝트로 전환.
      aprj.save
      redirect_to :back
      
    elsif params[:confirm]=="5"
    #//-------------------------------------------------------------------------"버튼눌러 ^비공개로^ 수정하기" 기능
      @one_prj = MyprjEach.find(params[:id])
      
      aprj = MyprjEach.find(params[:id])
      aprj.user_id = @one_prj.user_id
      aprj.myprj_each_img = @one_prj.myprj_each_img
      aprj.prj_title = @one_prj.prj_title
      aprj.prj_memo = @one_prj.prj_memo
      aprj.prj_content = @one_prj.prj_content
      aprj.prj_url = @one_prj.prj_url
      aprj.prj_ctgory = @one_prj.prj_ctgory
      aprj.lookable = 0 #// 0=비공개. 비공개프로젝트로 전환.
      aprj.save
      redirect_to :back
      
    end
      
  end
  
  def look_portfolio
    @a_prj = MyprjEach.all
    @b_prj = Array.new
    
    @a_prj.each do |a|
      if a.lookable == 1
      @b_prj << a
      else
      end
    end
    
    @b_prj = @b_prj.reverse
    
  end
  
  def each_project
    @p = MyprjEach.find(params[:id])
  end
end
