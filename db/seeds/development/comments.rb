comments_data = [
  "素晴らしいイベントですね！",
  "goodです",
  "楽しそうですね！",
  "いいですねー！",
  "楽しみにしています！",
  "待ち遠しいです！",
  "期待しています！",
  "子どもと一緒に行こうと思います。",
  "詳しく知りたいです。",
  "素敵な企画ですね！",
  "絶対に参加します！",
  "今回も行きます！",
  "友達を誘って一緒に行きます！",
  "今年も行きたいです。",
  "初めてですが参加したいです！",
  "とっても楽しみです。",
  "家族で行きます。",
  "近所の人にも伝えます！",
  "素晴らしいですね！",
  "いいイベントですね！",
  "楽しみなイベントです。",
  "雰囲気がよさそうですね。",
  "行ってみたいです。",
  "行きます！"
]

Event.all.each do |event|
  # 各イベントごとに使用済みコメントをリセット
  used_comments = []
  # イベント主催者以外のユーザーの配列を作成
  commentators = User.where.not(id: event.user_id).to_a

  rand(1..5).times do
    unused_comments = comments_data - used_comments
    comment = unused_comments.sample
    used_comments << comment

    random_commentator = commentators.sample
    event.comments.create(
      user_id: random_commentator.id,
      comment: comment
    )

    # 選択されたコメント者をcommentatorsから削除
    commentators.delete(random_commentator)
  end
end
