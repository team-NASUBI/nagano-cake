Customer.create!(last_name: "茄子美",
                 first_name: "太郎",
                 kana_last_name: "ナスビ",
                 kana_first_name: "タロウ",
                 email: "test@test.com",
                 password: "password",
                 password_confirmation: "password",
                 withdrawal_status: false,
                 postal_code: "1234567",
                 prefecture_code: "1",
                 address: "東京都渋谷代々木神園町0-0",
                 telephone_number: "09011112222",
                 )

49.times do |n|
    gimei = Gimei.unique.name
    address = Gimei.unique.address

    last_name = gimei.last.kanji
    first_name = gimei.first.kanji
    kana_last_name = gimei.last.katakana
    kana_first_name = gimei.first.katakana

    email = "example-#{n+1}@example.com"

    password = "password"

    postal_code = rand(1000000..9999999).to_s
    telephone_number = rand(1000000000..9999999999).to_s


    Customer.create!(last_name: last_name,
                 first_name: first_name,
                 kana_last_name: kana_last_name,
                 kana_first_name: kana_first_name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 withdrawal_status: false,
                 postal_code: postal_code,
                 prefecture_code: "1",
                 address: address.kanji,
                 telephone_number: telephone_number,
                 )
end

Genre.create!(name: "未分類")

Product.create!(name: "ケーキ",
                genre_id: 1,
                introduction: "おいしいよ",
                price: 500,
                now_on_sale: true
                )

Product.create!(name: "プリン",
                genre_id: 1,
                introduction: "おいしいよ",
                price: 500,
                now_on_sale: true
                )

Product.create!(name: "キャンディー",
                genre_id: 1,
                introduction: "おいしいよ",
                price: 500,
                now_on_sale: true
                )

Product.create!(name: "クッキー",
                genre_id: 1,
                introduction: "おいしいよ",
                price: 500,
                now_on_sale: true
                )

Admin.create!(email: "admin@test.com",
              password: "password",
              password_confirmation: "password")


ShippingAddress.create!(customer_id: 1,
                 shipping_name: "ミッキーマウス",
                 postal_code: "2790031",
                 prefecture_code: "1",
                 address: "千葉県浦安市舞浜1-1"
                 )

