location_prefixes = [
  "さくら",
  "やまぶき",
  "ひまわり",
  "ゆり",
  "すみれ",
  "ちゅうりっぷ",
  "あじさい",
  "ひょうたん",
  "たんぽぽ",
  "あさがお",
  "つつじ",
  "ほおずき",
  "すすき",
  "すずらん",
  "あやめ",
  "こすもす",
  "りんどう",
  "ぼたん",
  "ぱんじー",
  "さくらんぼ",
  "なでしこ",
  "かすみ",
  "あおい",
  "しずく",
  "ふうせんか",
  "もみじ",
  "ばら",
  "いちご"
]

event_data = [
  # イベント1
  {
    title: "納涼盆踊り大会",
    description: "今年もこの季節がやってきました。太鼓の音と音楽に合わせて楽しく踊って最高の夏の思い出を作りましょう。夜店もたくさん出ますよ！ぜひ参加してください！入場無料です。",
    event_start_date: "2024-08-25",
    event_start_time: "15:00",
    event_end_date: "2024-08-25",
    event_end_time: "21:00",
    city: "千代田区",
    location: "#{location_prefixes.sample}広場",
    ticket_price: 0,
    categories: ["お祭り", "伝統文化", "季節のイベント"]
  },
  #イベント2
  {
    title: "東京第一大学学園祭",
    description: "サークルや体育会による催し物、研究発表、参加型イベント、音楽ライブ、漫才・コント、模擬店など、さまざまな楽しい企画を実施します！多数のご来場お待ちしています！",
    event_start_date: "2024-10-7",
    event_start_time: "11:00",
    event_end_date: "2024-10-07",
    event_end_time: "19:00",
    city: "中央区",
    location: "東京第一大学#{location_prefixes.sample}キャンパス",
    ticket_price: 0,
    categories: ["お祭り", "季節のイベント"]
  },
  #イベント3
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
    categories: ["お祭り", "季節のイベント"]
  },
  #イベント4
  {
    title: "フリーマーケット",
    description: "古着や使わなくなったお皿、家具、子どものおもちゃなど多数の出店があります。欲しいのものがきっと見つかりますよ！ぜひお越しください！入場無料です。出店希望の方は連絡先までお問い合わせください。",
    event_start_date: "2024-4-4",
    event_start_time: "11:00",
    event_end_date: "2024-4-4",
    event_end_time: "16:00",
    city: "新宿区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ"]
  },
  #イベント5
  {
    title: "琉球音楽フェスティバル",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "文京区",
    location: "#{location_prefixes.sample}大広場",
    ticket_price: 4000,
    categories: ["お祭り", "季節のイベント", "音楽"]
  },
  #イベント6
  {
    title: "夏休みラジオ体操",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "台東区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 4000,
    categories: ["健康", "季節のイベント"]
  },
  #イベント7
  {
    title: "初心者向け編み物教室",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "墨田区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 1000,
    categories: ["教室・ワークショップ"]
  },
  #イベント8
  {
    title: "パン作り教室",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "江東区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 1000,
    categories: ["教室・ワークショップ", "グルメ"]
  },
  #イベント9
  {
    title: "水彩画を学ぼう",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "品川区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 1000,
    categories: ["教室・ワークショップ"]
  },
  #イベント10
  {
    title: "メジロを探そう！みんなでバードウォッチング",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "目黒区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 1000,
    categories: ["自然", "動物", "教室・ワークショップ"]
  },
  #イベント11
  {
    title: "みんなで皇居ラン",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "大田区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 0,
    categories: ["スポーツ", "コミュニティ"]
  },
  #イベント12
  {
    title: "ストリートダンス体験会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "世田谷区",
    location: "#{location_prefixes.sample}公園噴水前広場",
    ticket_price: 0,
    categories: ["スポーツ", "教室・ワークショップ"]
  },
  #イベント13
  {
    title: "【シニア向け】ウォーキングで健康になろう",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "渋谷区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["スポーツ", "健康", "コミュニティ"]
  },
  #イベント14
  {
    title: "公園でサイクリングしよう",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "中野区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["スポーツ", "健康", "コミュニティ"]
  },
  #イベント15
  {
    title: "もちつき大会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "杉並区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["季節のイベント", "グルメ"]
  },
  #イベント16
  {
    title: "陶芸体験ワークショップ",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "豊島区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["教室・ワークショップ"]
  },
  #イベント17
  {
    title: "着付け教室",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "北区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["教室・ワークショップ", "伝統文化"]
  },
  #イベント18
  {
    title: "盆踊り練習会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "荒川区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "伝統文化"]
  },
  #イベント19
  {
    title: "ゴミ拾いクリーン作戦",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "板橋区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["地域活動"]
  },
  #イベント20
  {
    title: "防災訓練",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "練馬区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["地域活動", "防災"]
  },
  #イベント21
  {
    title: "子育てパパ教室",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "足立区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["子ども", "学び","教室・ワークショップ"]
  },
  #イベント22
  {
    title: "絵本よみきかせ会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "葛飾区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["子ども"]
  },
  #イベント23
  {
    title: "スイーツを食べながらお話ししよう",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "江戸川区",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "グルメ"]
  },
  #イベント24
  {
    title: "サッカー日本代表親善試合パブリックビューイング",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "檜原村",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "スポーツ"]
  },
  #イベント25
  {
    title: "地域マラソン大会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "八王子市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["地域活動", "スポーツ"]
  },
  #イベント26
  {
    title: "ふたご座流星群観測会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "立川市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["自然", "教室・ワークショップ"]
  },
  #イベント27
  {
    title: "商店街イルミネーション",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "武蔵野市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["季節のイベント"]
  },
  #イベント28
  {
    title: "路上ライブやります",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "三鷹市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["音楽"]
  },
  #イベント29
  {
    title: "ヨガで健康になろう",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "青梅市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["健康"]
  },
  #イベント30
  {
    title: "フレイル予防講座",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "府中市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["健康"]
  },
  #イベント31
  {
    title: "福祉作業所お菓子販売会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "昭島市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["福祉", "グルメ"]
  },
  #イベント32
  {
    title: "いもほり",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "調布市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["自然", "季節のイベント"]
  },
  #イベント33
  {
    title: "乳幼児向けおはなし会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "町田市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["子ども"]
  },
  #イベント34
  {
    title: "これからのダイバーシティを考える！トークセッション",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "小金井市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["学び", "教室・ワークショップ"]
  },
  #イベント35
  {
    title: "犬猫里親見学会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "小平市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["動物"]
  },
  #イベント36
  {
    title: "まつり囃子練習の見学に来ませんか",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "日野市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "伝統文化"]
  },
  #イベント37
  {
    title: "シェークスピアで学ぶ英語教室",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "東村山市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["学び", "教室・ワークショップ"]
  },
  #イベント38
  {
    title: "手話を学んでみませんか",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "国分寺市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["学び", "教室・ワークショップ", "福祉"]
  },
  #イベント39
  {
    title: "もの忘れチェック講習会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "国立市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["学び", "教室・ワークショップ", "健康"]
  },
  #イベント40
  {
    title: "演劇体験ワークショップ",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "国立市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["教室・ワークショップ"]
  },
  #イベント41
  {
    title: "災害ボランティア募集",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "福生市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["防災", "地域活動"]
  },
  #イベント42
  {
    title: "愛犬を連れて集まりましょう",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "東大和市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["動物", "コミュニティ"]
  },
  #イベント43
  {
    title: "古着回収のお知らせ",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "清瀬市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["地域活動"]
  },
  #イベント44
  {
    title: "みんなでもくもく勉強会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "東久留米市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "学び"]
  },
  #イベント45
  {
    title: "桜の写真を撮りに行こう〜プロに学ぶ構図のヒント〜",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "武蔵村山市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["教室・ワークショップ", "学び"]
  },
  #イベント46
  {
    title: "小学生囲碁将棋大会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "多摩市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["子ども"]
  },
  #イベント47
  {
    title: "小学校プール開放日",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "稲城市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["子ども", "スポーツ"]
  },
  #イベント48
  {
    title: "フットサルやりたい人集まれ！",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "羽村市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "スポーツ"]
  },
  #イベント49
  {
    title: "町民大運動会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "あきる野市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "地域活動"]
  },
  #イベント50
  {
    title: "まちづくり意見交換会",
    description: "夏の風物詩の琉球音楽フェスティバル！今年もやりますよ！沖縄出身のミュージシャンが奏でる琉球ミュージックに癒されませんか？琉球音楽をこよなく愛するミュージシャンたちと、一日限りのフェスティバルを楽しみましょう。",
    event_start_date: "2024-7-29",
    event_start_time: "13:00",
    event_end_date: "2024-7-29",
    event_end_time: "20:00",
    city: "西東京市",
    location: "#{location_prefixes.sample}公園",
    ticket_price: 0,
    categories: ["コミュニティ", "地域活動"]
  },
]

event_data.each do |event_info|
  favourites_count = rand(1..10)
  prefecture = "東京都"

  event = Event.new(
    user_id: User.pluck(:id).sample,
    title: event_info[:title],
    description: event_info[:description],
    event_start_date: event_info[:event_start_date],
    event_start_time: event_info[:event_start_time],
    event_end_date: event_info[:event_end_date],
    event_end_time: event_info[:event_end_time],
    prefecture: prefecture,
    city: event_info[:city],
    location: event_info[:location],
    ticket_price: event_info[:ticket_price],
    favourites_count: favourites_count,
    phone_number: Faker::PhoneNumber.phone_number
  )

  event_info[:categories].each do |category_name|
    category = Category.find_or_create_by(category: category_name)
    event.categories << category
  end
end
