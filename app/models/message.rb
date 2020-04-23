class Message < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :user, optional: true
  belongs_to :creator, optional: true
  # メッセージの保存に成功したらBroadCastJobに投げる
  after_create_commit { BroadCastMessageJob.perform_later self }

end
