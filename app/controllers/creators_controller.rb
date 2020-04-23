class CreatorsController < ApplicationController

  def new
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params)
    @creator["user_id"] = current_user.id
    if @creator.save
      redirect_to creator_path(@creator.id)
    end
  end

  def show
    @creator = Creator.find(params[:id])
    unless current_user.creator
      rooms = current_user.rooms
      #自分が入ってるroomの相手のidを格納する
      @creator_ids = []
      rooms.each do |r|
        @creator_ids << r.creator_id
      end
    else
      rooms = current_user.creator.rooms
      #自分が入ってるroomの相手のidを格納する
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end

  private
  def creator_params
    params.require(:creator).permit(:name)
  end
end
