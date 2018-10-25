require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Administrator.create email: 'root@root.com', password: 'rootroot' unless Administrator.find_by email: 'root@root.com'
GlobalAppInformation.create! unless GlobalAppInformation.first.present?
global_app_information = GlobalAppInformation.first!

if Vehicle.all.empty? || ConstructionRecord.all.empty?
  Dir.foreach(Rails.root.join(*%w[db seed_data])) do |file|
    next unless file.match? /heisei[0-9]+.csv|vehicles.csv/

    case file
    when /vehicles.csv/
      CSV.foreach(Rails.root.join('db', 'seed_data', file)) do |row|
        name, serial, make, amount = row
        Vehicle.create! name: name,
                        serial: serial,
                        make: make,
                        amount: amount.to_i
      end
    when /heisei[0-9]+.csv/
      category = :civil
      CSV.foreach(Rails.root.join('db', 'seed_data', file)) do |row|
        category = :architecture if row[0].blank?
        category = :joint if row[0] == 'joint'
        next if row[0].blank? || row[0] == 'joint'

        customer, title, started_on, finished_on = row
        ConstructionRecord.create! customer: customer,
                                   title: title,
                                   started_on: JapaneseDate.from_japanese(started_on).western_date,
                                   finished_on: JapaneseDate.from_japanese(finished_on).western_date,
                                   category: category
      end
    end
  end
end

unless global_app_information.company_profile.present?
  profile_text = <<~PROFILESTRING
    **所在地**  　〒670-0966　兵庫県姫路市延末86-5（姫路市文化センター　東隣り）

    **連絡先**  　TEL：079-294-3326    FAX：079-292-6396

    **創業**  　　昭和37年10月15日

    **資本金**  　3,000万円

    **代表者**  　岩田　大輔

    **事業内容**  土木工事業・建築工事業・宅地建物取引業 他

    **各種資格**

    - 建設許可番号（土木・建築・舗装・大工・石・タイル・レンガ・ブロック・鉄筋・しゅんせつ・内装仕上・鳶・屋根・ 鋼構造物・塗装・水道施設）兵庫県知事（特－27）第460085号　平成27年6月30日
    - 一級建築士事務所登録番号　　　（一級）第450908号
    - 宅地建物取引業者　　　兵庫県知事（5）第450869号
  PROFILESTRING

  profile = global_app_information.build_company_profile body: profile_text
  profile.save!
end

if HistoricalRecord.all.empty?
  [
    { title: '昭和　３７年　１０月　１５日',
      body: <<~FIRSTBODY
              臨界建設工業株式会社創業業

              主として土木建築請負業として発足
              払込資本金　　100万円（授権資本金　４００万円）
              本　　　社　　姫路市堅町５０番地に設置
            FIRSTBODY
    },
    { title: '昭和　４０年　１２月　１８日',
      body: '資本金変更　　払込資本金　３００万円' },
    { title: '昭和　４３年　　６月　１０日',
      body: '1級建設士事務所開設' },
    { title: '昭和　４３年　　９月　１７日',
      body: '資本金変更　　払込資本金　８５０万円' },
    { title: '昭和　４５年　　７月　１３日',
      body: '資本金変更　　払込資本金　２,０００万円' },
    { title: '昭和　４６年　１０月　　１日',
      body: '相生出張所開設' },
    { title: '昭和　４７年　　７月　　１日',
      body: '大阪支店開設' },
    { title: '昭和　４８年　　４月　２４日',
      body: '宅地建設物取引業及び宅地開発事業開始' },
    { title: '昭和　４９年　１１月　２０日',
      body: '赤穂出張所開設' },
    { title: '昭和　５６年　　１月　　８日',
      body: '現在地に本社移転' },
    { title: '平成　　３年　　３月　　１日',
      body: '相生出張所を相生支店とする' },
    { title: '平成　　４年　　４月　　１日',
      body: '警備部事業開始' },
    { title: '平成　　６年　１２月　１１日',
      body: '相生宿舎設置' },
    { title: '平成　　９年　　２月　　７日',
      body: '変更　　払込資本金　３,０００万円' },
  ].each { |params| HistoricalRecord.create! params }
end
