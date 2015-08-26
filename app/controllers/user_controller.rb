class UserController < ApplicationController

  def user_params#--------------------------------------이 함수의 의미?
    params.require(:user).permit( :user_name,
                                  :user_email,
                                  :user_password,
                                  :user_sex,
                                  :user_team,
                                  :user_univ,
                                  :user_phone,
                                  :user_gold,
                                  :user_icon,
                                  :user_open,
                                  :user_exp,
                                  :user_level,
                                  :user_exp,
                                  :user_mailing,
                                  :user_open)
                                  
  end

  def test
    
  end
  
  def login
    @user = User.new
  end

  def logout
    reset_session
    redirect_to '/'
  end

  def login_confirm
    @error_message=""
    @user = User.new(user_params)
    @user.user_password = Digest::SHA256.hexdigest @user.user_password
    
    @u = User.where(:user_email => @user.user_email, :user_password => @user.user_password).take
    #u_password = Digest::SHA256.hexdigest params[:user_password]
    #@u = User.where(:user_email => params[:user_email], :user_password => u_password).take
    
    if @u.nil?
      @error_message = "이메일과 비밀번호를 확인해주세요."
      render :action => 'login'
      return
    end
    
    session[:user_id] = @u.id
    session[:user_email] = @u.user_email
    session[:user_password] = @u.user_password
    
    puts session[:user_id]
    
    redirect_to '/'
  end

  def join
    @univ2 = Array.new
    i=0
    $univ.each do |x|
      @univ2 << [x , i]
      i+=1
    end
    @user = User.new
  end
  
  def join_confirm
    @user = User.new(user_params)
    
    @user.user_password = Digest::SHA256.hexdigest @user.user_password
    
    if @user.save
      flash[:notice] = "Successfully created user."
      
      @user = User.where(:user_email => @user.user_email).take
      session[:user_id] = @user.id
      session[:user_password] = @user.user_password
      
      redirect_to '/'
    else
      render :action => 'join'
    end
    
  end
end
