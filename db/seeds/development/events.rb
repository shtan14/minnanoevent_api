location_prefixes = %w[
  さくら
  やまぶき
  ひまわり
  ゆり
  すみれ
  ちゅうりっぷ
  あじさい
  ひょうたん
  たんぽぽ
  あさがお
  つつじ
  ほおずき
  すすき
  すずらん
  あやめ
  こすもす
  りんどう
  ぼたん
  ぱんじー
  さくらんぼ
  なでしこ
  かすみ
  あおい
  しずく
  ふうせんか
  もみじ
  ばら
  いちご
]

event_data = [
  # イベント1
  {
    title: "納涼盆踊り大会",
    description: "今年もこの季節がやってきました。太鼓の音と軽快な音楽に合わせて楽しく踊って最高の夏の思い出を作りましょう。夜店もたくさん出ますよ！ぜひ参加してください！入場無料です。",
    event_start_date: "2024-08-25",
    event_start_time: "15:00",
    event_end_date: "2024-08-25",
    event_end_time: "21:00",
    city: "大田区",
    location: "#{location_prefixes.sample}大広場",
    ticket_price: 0,
    categories: %w[お祭り 伝統文化 季節のイベント]
  },
  # イベント2
  {
    title: "東京第一大学学園祭",
    description: "サークルや体育会による催し物、研究発表、参加型イベント、音楽ライブ、漫才・コント、模擬店など、さまざまな楽しい企画を実施します！多数のご来場お待ちしています！",
    event_start_date: "2024-10-7",
    event_start_time: "11:00",
    event_end_date: "2024-10-07",
    event_end_time: "18:00",
    city: "中央区",
    location: "東京第一大学#{location_prefixes.sample}キャンパス",
    ticket_price: 0,
    categories: %w[お祭り 季節のイベント]
  },
  # イベント3
  {
    title: "商店街サマーフェスティバル",
    description: "やきそば、かき氷、イカ焼き、ビール！たくさんの店舗が出店します！お買い上げいただくとくじ引きもできます！ぜひお越しください！スタンプラリーもありますよー！",
    event_start_date: "2024-8-5",
    event_start_time: "14:00",
    event_end_date: "2024-8-5",
    event_end_time: "20:00",
    city: "港区",
    location: "#{location_prefixes.sample}商店街",
    ticket_price: 0,
    categories: %w[お祭り 季節のイベント]
  },
  # イベント4
  {
    title: "フリーマーケット",
    description: "古着や使わなくなった食器、家具、子どものおもちゃなど多数の出店があります。欲しいのものがきっと見つかりますよ！ぜひお越しください！入場無料です。出店希望の方は連絡先までお問い合わせください。",
    event_start_date: "2024-9-28",
    event_start_time: "10:00",
    event_end_date: "2024-9-28",
    event_end_time: "16:00",
    city: "新宿区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ"]
  },
  # イベント5
  {
    title: "琉球音楽フェスティバル",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "文京区",
    location: "#{location_prefixes.sample}大広場特設ステージ",
    ticket_price: 4000,
    categories: %w[お祭り 季節のイベント 音楽]
  },
  # イベント6
  {
    title: "夏休みラジオ体操",
    description: "夏休みの小中学生、そのほかどなたでも参加できます！全部の回に出席した方には皆勤賞として特別な景品をプレゼント！早起きは三文の徳！ぜひご参加ください",
    event_start_date: "2024-7-25",
    event_start_time: "06:00",
    event_end_date: "2024-7-25",
    event_end_time: "06:30",
    city: "台東区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 0,
    categories: %w[健康 季節のイベント]
  },
  # イベント7
  {
    title: "初心者向け編み物教室",
    description: "まずは簡単なコースター作りから！講師がかぎ針の持ち方から教えます。かぎ針とお好きな毛糸だけ持ち寄って参加してください",
    event_start_date: "2024-5-29",
    event_start_time: "13:00",
    event_end_date: "2024-5-29",
    event_end_time: "16:00",
    city: "墨田区",
    location: "#{location_prefixes.sample}会館第一教室",
    ticket_price: 1000,
    categories: ["教室・ワークショップ"]
  },
  # イベント8
  {
    title: "パン作り教室",
    description: "講師が育てたぶどう酵母を使って、かんたん丸パン作りをしませんか？作ったパンはお持ち帰りOK。参加希望の方は電話かインスタのDMください！",
    event_start_date: "2024-6-2",
    event_start_time: "10:00",
    event_end_date: "2024-6-2",
    event_end_time: "14:00",
    city: "江東区",
    location: "#{location_prefixes.sample}中学校調理室",
    ticket_price: 1000,
    categories: ["教室・ワークショップ", "グルメ"]
  },
  # イベント9
  {
    title: "水彩画を学ぼう",
    description: "絵を描いてみたいけど、センスもないし道具もない、、。そんなアナタ！水彩画は、コツさえつかめばだれでも上手な絵に見えるんです。美大出身の講師がセンスよく色を使う裏技をご紹介します。新たな趣味を作りたい人にもオススメ",
    event_start_date: "2024-9-15",
    event_start_time: "19:00",
    event_end_date: "2024-9-15",
    event_end_time: "21:00",
    city: "品川区",
    location: "#{location_prefixes.sample}公民館",
    ticket_price: 500,
    categories: ["教室・ワークショップ"]
  },
  # イベント10
  {
    title: "メジロを探そう！みんなでバードウォッチング",
    description: "バードウォッチングは特別な道具がないと始められないと思っていませんか？身一つでOK！まずは幸運の鳥と呼ばれるメジロを見つけましょう",
    event_start_date: "2024-5-9",
    event_start_time: "09:00",
    event_end_date: "2024-5-9",
    event_end_time: "12:00",
    city: "目黒区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["自然", "動物", "教室・ワークショップ"]
  },
  # イベント11
  {
    title: "みんなで皇居ラン",
    description: "皇居ランしてみたいけどなんとなく不安な方いませんか？ランニングが趣味の人たちで集まってみんなで楽しく皇居を走りませんか？それぞれのペースでOK！一緒に走りましょう！",
    event_start_date: "2024-10-2",
    event_start_time: "08:00",
    event_end_date: "2024-10-2",
    event_end_time: "10:00",
    city: "千代田区",
    location: "#{location_prefixes.sample}前広場",
    ticket_price: 0,
    categories: %w[スポーツ コミュニティ]
  },
  # イベント12
  {
    title: "ストリートダンス体験会",
    description: "ストリートダンス歴15年超の講師が、初めての方にもわかりやすく、楽しく教えます！ビートに身をゆだねて自由に楽しく踊りましょう。まずは体験から！ぜひご参加ください！。",
    event_start_date: "2024-11-20",
    event_start_time: "19:00",
    event_end_date: "2024-11-20",
    event_end_time: "21:00",
    city: "世田谷区",
    location: "#{location_prefixes.sample}センター第1スタジオ",
    ticket_price: 0,
    categories: ["スポーツ", "教室・ワークショップ"]
  },
  # イベント13
  {
    title: "シニア向けウォーキングで健康になろう",
    description: "ウォーキングは健康維持の第1歩！手軽にできるウォーキングで、美しく正しい歩き方と姿勢を身につけましょう。ぜひお気軽にご参加ください！",
    event_start_date: "2024-10-9",
    event_start_time: "09:00",
    event_end_date: "2024-10-9",
    event_end_time: "12:00",
    city: "渋谷区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: %w[スポーツ 健康 コミュニティ]
  },
  # イベント14
  {
    title: "公園でサイクリングしよう",
    description: "サイクリングで爽やかな風を浴びましょう！公園内のサイクリングロード走るので初心者の方でも安心です。自転車の正しい乗り方から身につけられますよ。ぜひ一緒に走りましょう！",
    event_start_date: "2024-3-9",
    event_start_time: "09:00",
    event_end_date: "2024-3-9",
    event_end_time: "11:00",
    city: "中野区",
    location: "#{location_prefixes.sample}公園大時計前",
    ticket_price: 0,
    categories: %w[スポーツ 健康 コミュニティ]
  },
  # イベント15
  {
    title: "もちつき大会",
    description: "やってきましたお正月、毎年恒例もちつき大会！ゲストは大相撲の力士さんたち！力強くついたおもちは格別ですよ＾＾数量限定なのでお早めに。",
    event_start_date: "2024-1-3",
    event_start_time: "10:00",
    event_end_date: "2024-1-3",
    event_end_time: "14:00",
    city: "杉並区",
    location: "#{location_prefixes.sample}小学校前イベント広場",
    ticket_price: 0,
    categories: %w[季節のイベント グルメ]
  },
  # イベント16
  {
    title: "陶芸体験ワークショップ",
    description: "陶芸をやってみたいけど難しそうで断念している方いませんか？講師が親切丁寧に教えるので心配無用です！作った作品はお持ち帰りいただけますよ。世界に一つだけの自分だけの作品をつくりましょう！",
    event_start_date: "2024-2-5",
    event_start_time: "13:00",
    event_end_date: "2024-2-5",
    event_end_time: "17:00",
    city: "豊島区",
    location: "#{location_prefixes.sample}ビル1階",
    ticket_price: 3000,
    categories: ["教室・ワークショップ"]
  },
  # イベント17
  {
    title: "着付け教室体験会",
    description: "着付け学んでみませんか？プロの講師から着物の歴史やマナー、所作まで総合的に学べます。まずは体験してみましょう。お気軽にお問い合わせください。",
    event_start_date: "2024-11-12",
    event_start_time: "10:00",
    event_end_date: "2024-11-12",
    event_end_time: "12:00",
    city: "北区",
    location: "#{location_prefixes.sample}区民会館",
    ticket_price: 0,
    categories: ["教室・ワークショップ", "伝統文化"]
  },
  # イベント18
  {
    title: "盆踊り練習会",
    description: "来たる夏の盆踊り大会にむけて練習会を実施しますよ！初心者でも全く問題ありません！楽しく練習してすぐに踊れるようになっちゃいます！今年は見る側から踊る側で参加しよう！ご参加お待ちしています！",
    event_start_date: "2024-6-10",
    event_start_time: "19:00",
    event_end_date: "2024-6-10",
    event_end_time: "21:00",
    city: "荒川区",
    location: "#{location_prefixes.sample}公民館",
    ticket_price: 0,
    categories: %w[コミュニティ 伝統文化]
  },
  # イベント19
  {
    title: "ゴミ拾いクリーン作戦",
    description: "今年もやりますゴミ拾いクリーン作戦！みんなでまちを綺麗にしましょう！参加賞も用意しています！ぜひ参加してください。",
    event_start_date: "2024-4-8",
    event_start_time: "08:00",
    event_end_date: "2024-4-8",
    event_end_time: "10:00",
    city: "板橋区",
    location: "#{location_prefixes.sample}駅前広場",
    ticket_price: 0,
    categories: ["地域活動"]
  },
  # イベント20
  {
    title: "防災訓練",
    description: "災害はいつ起きるかわかりません。今後30年以内に70％の確率で大地震が起きると言われています。防災訓練で今一度災害への備えを行いましょう。消防クレーン車もくるよ！子どもたちも参加してね！",
    event_start_date: "2024-5-2",
    event_start_time: "09:00",
    event_end_date: "2024-5-2",
    event_end_time: "12:00",
    city: "練馬区",
    location: "#{location_prefixes.sample}小学校グラウンド",
    ticket_price: 0,
    categories: %w[地域活動 防災 子ども]
  },
  # イベント21
  {
    title: "子育てパパ教室",
    description: "赤ちゃんの抱き方やもく浴、おむつ交換などの実践的なテクニックのほか、妊娠中のママに必要な栄養も学べます。お気軽に参加してください。",
    event_start_date: "2024-6-5",
    event_start_time: "19:00",
    event_end_date: "2024-6-5",
    event_end_time: "21:00",
    city: "足立区",
    location: "#{location_prefixes.sample}保健所",
    ticket_price: 0,
    categories: ["子ども", "学び", "教室・ワークショップ"]
  },
  # イベント22
  {
    title: "絵本よみきかせ会",
    description: "今月の絵本よみきかせ会は秋をテーマにした絵本です。夜の静けさ、虫の声、美しい月。秋を感じる絵本を楽しみましょう。ぜひご参加ください。",
    event_start_date: "2024-9-15",
    event_start_time: "13:00",
    event_end_date: "2024-9-15",
    event_end_time: "15:00",
    city: "葛飾区",
    location: "#{location_prefixes.sample}市民会館",
    ticket_price: 0,
    categories: ["子ども"]
  },
  # イベント23
  {
    title: "スイーツを食べながらお話ししよう",
    description: "食欲の秋到来です！甘くて美味しいスイーツを食べながらまったりお話ししませんか？お気に入りのスイーツをお持ちいただきご参加ください！",
    event_start_date: "2024-10-9",
    event_start_time: "15:00",
    event_end_date: "2024-10-9",
    event_end_time: "17:00",
    city: "江戸川区",
    location: "#{location_prefixes.sample}町民会館",
    ticket_price: 0,
    categories: %w[コミュニティ グルメ]
  },
  # イベント24
  {
    title: "サッカー日本代表親善試合パブリックビューイング",
    description: "サムライブルーをみんなで応援しよう！大画面スクリーンでみんなでサッカー観戦！ぜひお越しください！",
    event_start_date: "2024-11-7",
    event_start_time: "19:00",
    event_end_date: "2024-11-7",
    event_end_time: "21:00",
    city: "檜原村",
    location: "#{location_prefixes.sample}会館第2教室",
    ticket_price: 0,
    categories: %w[コミュニティ スポーツ]
  },
  # イベント25
  {
    title: "地域マラソン大会",
    description: "今年で15回目の地域マラソン大会！みんなで襷をつなぐ、名物リレーマラソンもありますよ！ぜひご参加ください！沿道応援も大歓迎です！みんなで大会を盛り上げましょう！",
    event_start_date: "2024-12-3",
    event_start_time: "10:00",
    event_end_date: "2024-12-3",
    event_end_time: "14:00",
    city: "八王子市",
    location: "#{location_prefixes.sample}道路特設コース",
    ticket_price: 0,
    categories: %w[地域活動 スポーツ]
  },
  # イベント26
  {
    title: "ふたご座流星群観測会",
    description: "みんなでふたご座流星群を観測しませんか？公園で寝そべりながら眺める星空は最高ですよ！天文学の先生にもお越しいただき、星の歴史のお話も聞けますよ！ぜひぜひご参加ください！とても寒いので防寒対策はしっかりとお願いします！",
    event_start_date: "2024-12-14",
    event_start_time: "21:00",
    event_end_date: "2024-12-14",
    event_end_time: "22:00",
    city: "立川市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["自然", "教室・ワークショップ"]
  },
  # イベント27
  {
    title: "商店街イルミネーション",
    description: "冬の風物詩の商店街イルミネーション！ケヤキ並木が鮮やかに彩られます。幻想的なイルミネーションを今年もお楽しみください！",
    event_start_date: "2024-12-1",
    event_start_time: "18:00",
    event_end_date: "2024-12-29",
    event_end_time: "23:00",
    city: "武蔵野市",
    location: "#{location_prefixes.sample}商店街参道",
    ticket_price: 0,
    categories: ["季節のイベント"]
  },
  # イベント28
  {
    title: "路上ライブやります",
    description: "路上ライブを行います！オリジナルソングのほか、みんな知ってるあんな曲やこんな曲も演奏して盛り上げます！絶対に楽しめるのでぜひ来てください！",
    event_start_date: "2024-5-17",
    event_start_time: "19:00",
    event_end_date: "2024-5-17",
    event_end_time: "20:00",
    city: "三鷹市",
    location: "#{location_prefixes.sample}駅前広場",
    ticket_price: 0,
    categories: ["音楽"]
  },
  # イベント29
  {
    title: "ヨガで健康になろう",
    description: "ヨガは姿勢の改善やリラクゼーションに効果があります。講師が丁寧に指導するので初心者でも安心です。ぜひご参加ください。ご参加は当日会場まで。",
    event_start_date: "2024-7-20",
    event_start_time: "09:00",
    event_end_date: "2024-7-20",
    event_end_time: "11:00",
    city: "青梅市",
    location: "#{location_prefixes.sample}健康ホール",
    ticket_price: 0,
    categories: ["健康"]
  },
  # イベント30
  {
    title: "フレイル予防講座",
    description: "加齢や病気によって心身の機能が低下する「フレイル」やその予防方法を学ぶ講座です。フレイルになっても、早めに気づき、適切な取組みを行うことで、フレイルの進行を防ぎ、健康な状態に戻ることができます。ぜひご参加ください",
    event_start_date: "2024-8-2",
    event_start_time: "13:00",
    event_end_date: "2024-8-2",
    event_end_time: "15:00",
    city: "府中市",
    location: "#{location_prefixes.sample}福祉センター",
    ticket_price: 0,
    categories: %w[福祉 健康]
  },
  # イベント31
  {
    title: "福祉作業所お菓子販売会",
    description: "福祉作業所で働く障がいを持ったメンバーがつくったお菓子の販売会を開催します。プロ顔負けの焼き菓子やクッキーなど、たくさんの種類を販売します。ぜひお立ち寄りください！",
    event_start_date: "2024-12-7",
    event_start_time: "13:00",
    event_end_date: "2024-12-7",
    event_end_time: "20:00",
    city: "昭島市",
    location: "#{location_prefixes.sample}出張所1階",
    ticket_price: 0,
    categories: %w[福祉 グルメ]
  },
  # イベント32
  {
    title: "みんなでいもほり",
    description: "今年もいもほり開催します！汚れてもいい服装、軍手、持ち帰る用の大きめの袋をご用意ください。焼き芋もやるよ！みんな参加してね！",
    event_start_date: "2024-11-3",
    event_start_time: "13:00",
    event_end_date: "2024-11-3",
    event_end_time: "15:00",
    city: "調布市",
    location: "#{location_prefixes.sample}芋畑",
    ticket_price: 0,
    categories: %w[自然 季節のイベント]
  },
  # イベント33
  {
    title: "乳幼児おはなし会",
    description: "０歳から３歳までの子どもとその保護者を対象とした乳幼児おはなし会を開催します。わらべうたと絵本の読み聞かせを行います。わらべうたや絵本を通じて子どもとたくさんコミュニケーションをしていきましょう。当日会場までお越しください。",
    event_start_date: "2024-1-27",
    event_start_time: "10:00",
    event_end_date: "2024-1-27",
    event_end_time: "12:00",
    city: "町田市",
    location: "#{location_prefixes.sample}子どもセンター",
    ticket_price: 0,
    categories: ["子ども"]
  },
  # イベント34
  {
    title: "これからのダイバーシティを考える！トークセッション",
    description: "ダイバーシティってなんだろう？変化の早い今の時代における真のダイバーシティ、多様性とは？様々なジャンルで活躍する方々をパネラーに迎えてトークセッションを開催します。ファシリテーターは、ただいま著書が話題沸騰中の東京第一大学のあの教授！ぜひご観覧ください。",
    event_start_date: "2024-3-5",
    event_start_time: "14:00",
    event_end_date: "2024-3-5",
    event_end_time: "16:00",
    city: "小金井市",
    location: "#{location_prefixes.sample}ビル大ホール",
    ticket_price: 0,
    categories: ["学び", "教室・ワークショップ"]
  },
  # イベント35
  {
    title: "保護犬保護猫里親見学会",
    description: "里親見学会を開催します。責任と愛情を持って終生飼育して頂ける新しい家族を探しています。ご質問は連絡先よりお問い合わせください。",
    event_start_date: "2024-3-3",
    event_start_time: "13:00",
    event_end_date: "2024-3-3",
    event_end_time: "17:00",
    city: "小平市",
    location: "#{location_prefixes.sample}パーク",
    ticket_price: 0,
    categories: ["動物"]
  },
  # イベント36
  {
    title: "まつり囃子練習の見学に来ませんか",
    description: "まつり囃子の練習会を行います。初心者歓迎！和太鼓、尺八、メンバーが丁寧に教えます。少しでも気になったらぜひ参加しちゃいましょう！当日会場にお越しください！",
    event_start_date: "2024-7-30",
    event_start_time: "10:00",
    event_end_date: "2024-7-30",
    event_end_time: "12:00",
    city: "日野市",
    location: "#{location_prefixes.sample}神社",
    ticket_price: 0,
    categories: %w[コミュニティ 伝統文化]
  },
  # イベント37
  {
    title: "シェークスピアで学ぶ英語教室",
    description: "英語に苦手意識を持っていませんか？シェークスピアを題材にストーリー仕立てで学んでいきますので、これまで英語学習に挫折した方でも大丈夫！参加希望の方は当日会場にお越しください。初回のみ教材代金いただきますのでご了承ください。",
    event_start_date: "2024-1-30",
    event_start_time: "15:00",
    event_end_date: "2024-1-30",
    event_end_time: "17:00",
    city: "東村山市",
    location: "#{location_prefixes.sample}市民ホール会議室",
    ticket_price: 3000,
    categories: ["学び", "教室・ワークショップ"]
  },
  # イベント38
  {
    title: "手話を学んでみませんか",
    description: "手話を始めてみませんか？手話講師が丁寧にレクチャーしますので自分のペースで学べます。お気軽にお問い合わせください。ご参加お待ちしています。",
    event_start_date: "2024-2-9",
    event_start_time: "14:00",
    event_end_date: "2024-2-9",
    event_end_time: "16:00",
    city: "国分寺市",
    location: "#{location_prefixes.sample}会館",
    ticket_price: 500,
    categories: ["学び", "教室・ワークショップ", "福祉"]
  },
  # イベント39
  {
    title: "もの忘れチェック講習会",
    description: "もの忘れや認知症が気になっていませんか？医師による講話で正しい知識を学び、認知症の気づきチェックなども行いましょう。日頃、不安に思っていることなどをゆっくりご相談ください。",
    event_start_date: "2024-2-2",
    event_start_time: "14:00",
    event_end_date: "2024-2-2",
    event_end_time: "16:00",
    city: "国立市",
    location: "#{location_prefixes.sample}ふれあいホール",
    ticket_price: 0,
    categories: ["学び", "教室・ワークショップ", "健康"]
  },
  # イベント40
  {
    title: "演劇体験ワークショップ",
    description: "演劇やってみませんか？初心者でも問題なし！講師が丁寧に楽しく指導します。全身をつかった演技、感情をこめた歌で自分をさらけ出しちゃいましょう！参加希望の方は当日会場にお越しください。",
    event_start_date: "2024-5-25",
    event_start_time: "13:00",
    event_end_date: "2024-5-25",
    event_end_time: "16:00",
    city: "国立市",
    location: "#{location_prefixes.sample}市民会館会議室",
    ticket_price: 0,
    categories: ["教室・ワークショップ"]
  },
  # イベント41
  {
    title: "災害ボランティア募集",
    description: "災害ボランティア募集しています。説明会を実施しますのでお気軽にご参加ください。",
    event_start_date: "2024-4-20",
    event_start_time: "19:00",
    event_end_date: "2024-4-20",
    event_end_time: "20:00",
    city: "福生市",
    location: "#{location_prefixes.sample}出張所会議室",
    ticket_price: 0,
    categories: %w[防災 地域活動]
  },
  # イベント42
  {
    title: "愛犬を連れて集まりましょう",
    description: "愛犬をつれて公園でミートアップしませんか？最近のわんちゃん事情、おすすめのドッグフード、穴場のドッグランなど、みんなで意見交換しましょう！当日会場でお待ちしています！",
    event_start_date: "2024-10-30",
    event_start_time: "14:00",
    event_end_date: "2024-10-30",
    event_end_time: "15:00",
    city: "東大和市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: %w[動物 コミュニティ]
  },
  # イベント43
  {
    title: "古着回収のお知らせ",
    description: "家に眠っている古着はありませんか？この機会にお出しください！リサイクルでとってもエコ！当日会場にお持ちください。お持ちいただいた方にゴミ袋差し上げます。",
    event_start_date: "2024-9-26",
    event_start_time: "09:00",
    event_end_date: "2024-9-26",
    event_end_time: "12:00",
    city: "清瀬市",
    location: "#{location_prefixes.sample}公園前",
    ticket_price: 0,
    categories: ["地域活動"]
  },
  # イベント44
  {
    title: "みんなでもくもく勉強会",
    description: "最近勉強のモチベーション落ちていませんか？みんなで勉強する環境があれば一人の時より継続できます！もくもくとそれぞれの課題に取り組みましょう。勉強友達が見つかるかも！当日会場にお越しください。出入り自由です。",
    event_start_date: "2024-4-4",
    event_start_time: "09:00",
    event_end_date: "2024-4-4",
    event_end_time: "21:00",
    city: "東久留米市",
    location: "#{location_prefixes.sample}カフェワークラウンジ",
    ticket_price: 0,
    categories: %w[コミュニティ 学び]
  },
  # イベント45
  {
    title: "桜の写真を撮りに行こう〜プロに学ぶ構図のヒント〜",
    description: "プロに学ぶカメラワークショップです。みんなで桜の写真を撮りに行き、撮った写真を見せあいましょう。講師による講評やアドバイスがもらえますよ。参加費とカメラをお持ちください。ご参加お待ちしています。",
    event_start_date: "2024-6-10",
    event_start_time: "10:00",
    event_end_date: "2024-6-10",
    event_end_time: "14:00",
    city: "武蔵村山市",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 2000,
    categories: ["教室・ワークショップ", "学び"]
  },
  # イベント46
  {
    title: "小学生囲碁将棋大会",
    description: "小学生囲碁将棋大会！始めたばかりの子でも参加大歓迎！ライバルと実力試ししよう！あの有名棋士がゲストで参加も！参加賞もあるのでお楽しみに。",
    event_start_date: "2024-5-4",
    event_start_time: "10:00",
    event_end_date: "2024-5-4",
    event_end_time: "16:00",
    city: "多摩市",
    location: "#{location_prefixes.sample}市民交流会館",
    ticket_price: 0,
    categories: ["子ども"]
  },
  # イベント47
  {
    title: "小学校プール開放日",
    description: "小学校のプール開放日のお知らせです。夏は学校プールで泳ぎましょう！",
    event_start_date: "2024-8-5",
    event_start_time: "09:00",
    event_end_date: "2024-8-5",
    event_end_time: "12:00",
    city: "稲城市",
    location: "#{location_prefixes.sample}小学校プール",
    ticket_price: 0,
    categories: %w[子ども スポーツ]
  },
  # イベント48
  {
    title: "フットサルやりたい人集まれ！",
    description: "フットサルで爽やかな汗をかきましょう！ビギナーでも、久々にボールを触る経験者でもどなたでも大歓迎です。ご参加希望の方はお気軽にご連絡ください。",
    event_start_date: "2024-1-10",
    event_start_time: "13:00",
    event_end_date: "2024-1-10",
    event_end_time: "15:00",
    city: "羽村市",
    location: "#{location_prefixes.sample}市民体育館",
    ticket_price: 0,
    categories: %w[コミュニティ スポーツ]
  },
  # イベント49
  {
    title: "町民大運動会",
    description: "今年も町民大運動会開催決定！綱引き、玉入れ、リレーなど楽しい種目が盛りだくさんです。当日飛び込み参加大歓迎！商店街の露店もでますよ。子どもも大人も大盛り上がりで楽しみましょう！ぜひお越しください！",
    event_start_date: "2024-3-30",
    event_start_time: "10:00",
    event_end_date: "2024-3-30",
    event_end_time: "15:00",
    city: "あきる野市",
    location: "#{location_prefixes.sample}市民スポーツセンター",
    ticket_price: 0,
    categories: %w[コミュニティ 地域活動 スポーツ]
  },
  # イベント50
  {
    title: "まちづくり意見交換会",
    description: "まちづくりについて皆さんの意見を聞かせてください！もっと住みやすく、安心安全な魅力あるまちにしていくための意見交換会を実施します。どなたでも参加歓迎です。お気軽にお越しください。",
    event_start_date: "2024-2-19",
    event_start_time: "18:00",
    event_end_date: "2024-2-19",
    event_end_time: "20:00",
    city: "西東京市",
    location: "#{location_prefixes.sample}地域交流センター",
    ticket_price: 0,
    categories: %w[コミュニティ 地域活動]
  }
]

event_data.each do |event_info|
  prefecture = "東京都"

  event = Event.new(
    user_id: User.pluck(:id).sample,
    title: event_info[:title],
    description: event_info[:description],
    event_start_datetime: "#{event_info[:event_start_date]} #{event_info[:event_start_time]}",
    event_end_datetime: "#{event_info[:event_end_date]} #{event_info[:event_end_time]}",
    prefecture: prefecture,
    city: event_info[:city],
    location: event_info[:location],
    ticket_price: event_info[:ticket_price],
    favourites_count: rand(1..10),
    phone_number: Faker::PhoneNumber.phone_number
  )

  event_info[:categories].each do |category_name|
    category = Category.find_or_create_by(category: category_name)
    event.categories << category
  end
end

puts "events = #{Event.count}"
