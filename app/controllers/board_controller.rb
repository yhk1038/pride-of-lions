class BoardController < ApplicationController
  def index
    @board_name = params[:board_name]
    @board = Board.where(:board_name => @board_name).take
    @post = @board.posts   # 질문게시글
    redirect_to '/board/index?board_name=' + @board_name + '&page=1' if params[:page].nil? || (params[:page] == "0") || params[:page].empty?
    @page = params[:page].to_i              # id(페이지)
    @k = @post.size                     # 게시글 수
  end

  def write
    redirect_to :back if params[:board_name].nil?
    @user_id = session[:user_id]
    @post = Post.new
    @board_name = params[:board_name]
    @board = Board.where(:board_name => @board_name).take
    @page = params[:page].to_i
  end

  def writing
    #@u = User.find(params[:user_id])
    @u = User.find(session[:user_id])
    @board = Board.find(params[:board_id])
    if @board.nil? || @u.nil?
      redirect_to :back
      return
    end
    
    post = Post.new
    post.board_id = @board.id
    post.post_user_name = @u.user_name
    post.post_user_univ = $univ[@u.user_univ]
    post.post_user_team = @u.user_team
    post.post_count = 0
    post.post_vote = 0
    post.post_secret = 0
    post.post_comments = 0
    post.post_title = params[:title]
    post.post_content = params[:content]
    post.save
    redirect_to "/board/index?board_name=" + @board.board_name + "&page=1"
  end

  def read
    @board_name = params[:board_name]
    @board = Board.where(:board_name => @board_name).take
    @post = Post.where(:board_id => @board.id, :id => params[:id].to_i).take
    @post.post_count += 1                      #조회수 올리기
    @post.save
    @user_id = session[:user_id]
    @comment = Comment.where(:board_id => @board.id, :post_id => @post.id)
  end

  def comment
    com = Comment.new
    com.comment_user_name = User.find(params[:user_id].to_i).user_name
    com.post_id = params[:id]
    com.board_id = params[:board_id]
    com.comment_content = params[:content]
    com.save
    
    redirect_to :back
  end

  def modify
    
  end

  def delete
    post = Post.find(params[:id])
    board_name = Board.find(post.board_id).board_name
    post.delete
    redirect_to "/board/index?board_name=" + board_name + "&page=1"
  end
end
