class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = Room.only_public
    @room = Room.new
    room_name = get_name(@user, current_user)
    @single_room = Room.find_by(name: room_name) || Room.create_private_room([@user, current_user], room_name)
    @message = Message.new
    @messages = @single_room.messages
    @users = User.except_me(current_user)
    render "rooms/index"
  end
  def get_name(user1, user2)
    users = [user1, user2].sort
    "private#{users[0].id}_#{users[1].id}"
  end
end
