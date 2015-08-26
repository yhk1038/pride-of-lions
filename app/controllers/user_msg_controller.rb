class UserMsgController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to :back
      return
    end
    
    @current_user = User.find(session[:user_id])
    @msgs = @current_user.user_msgs#.where(:to_user_id => session[:user_id])
    
    
  end

  def send_
    #@msg = UserMsg.new(msg_params)
    @msg = UserMsg.new
    #@current_user = User.find(session[:user_id])
    @msg.from_user_id = session[:user_id]
    @msg.msg_check = 0
    #@msg.to_user_id = params[:to_user_id]
    @msg.user_id = User.where(user_email: params[:to_user_id]).take.id
    #@msg.user_id = params[:to_user_id].to_i
    @msg.msg_content = params[:msg_content]
    #f = User.where(:user_email => @msg.msg_to_id).take
    #if f.nil?
    #    redirect_to '/msg/index'
    #    return
    #end
    #@msg.user_id = f.id
    
    #if @msg.save
    #  flash[:notice] = "Successfully sent a message."
    #  redirect_to '/msg/index'
    #else
    #  render :action => 'index'
    #end
    @msg.save
    redirect_to '/user_msg/index'
  end

  def read_
    
  end

  def write_
    @current_user = User.find(session[:user_id])
  end
end
