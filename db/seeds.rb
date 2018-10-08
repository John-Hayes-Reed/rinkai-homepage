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
