class RoomChannel < ApplicationCable::Channel
  def subscribed
    # このparams["room_id"]は上のroom.coffeeでsubscriptionを作る際に渡しているのがポイント。
    stream_from "room_channel_#{params['room_id']}"
  end

  def speak(data)
    # ここでRoomとMessageが紐付けられる。
    unless current_user.creator
      Message.create content: data['message'], is_user: true, room_id: params['room_id'], user_id: current_user.id, creator_id: params['creator_id']
    else
      Message.create content: data['message'], is_user: false, room_id: params['room_id'], creator_id: current_user.creator.id, user_id: user.id
    end
  end
end