# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'behindname@naver.com', password: 'qjqghkrud1!', password_confirmation: 'qjqghkrud1!') unless AdminUser.find_by(email: 'behindname@naver.com')

BUDDHA_LIST = ["석가모니불", "문수보살", "보현보살", "다보여래불", "준제보살", "약사여래불", "아미타불",  
  "관세음보살", "대세지보살", "보명여래불", "혜위등왕불", "지장보살", "수미산정 산왕불", "치성광여래불 ",
  "광명불", "무현보살", "모현보살", "자재통왕불", "상행왕 정행왕보살", "현지보살", "화엄성중", "오백나한",  
  "지신재"]

# 서울 = 1, 춘천본사 = 2, 부산분원 = 3, /*영산불교대학 = 4,*/ 대전분원 = 5, 고성분원 = 6, 제주2본산 = 7, 일본분원 = 8, 대구분원 = 9
TEMPLE_LIST = %w(춘천본사 제주제2본산 부산분원 김해분원 대전분원 대구분원 고성분원 일본분원)

DHARMA_NAMES = %w(덕운 덕행 일승 대승 수정 원오 법성 법운 법광 다보향 보살향 보리심 여래장)

def get_phone
  "010-#{rand(9000) + 1000}-#{rand(9000) + 1000}"
end

def get_description
  Faker::Lorem.sentence(word_count: 30)
end


def generate_buddhas
  BUDDHA_LIST.each_with_index do |buddha, index|
    Buddha.create(name: buddha, position: index)
  end
end

def generate_temples
  TEMPLE_LIST.each_with_index do |local_temple, index|
    Temple.create(place: local_temple, position: index)
  end
end

def generate_users
  10.times do |index|
    object_hash = {
      email: "test#{index}@hyunjisa.com",
      password: "password",
      temple_id: Temple.all.sample.id,
      name: "#{Faker::Name.last_name} 스님".delete(' '),
      addressProvince: rand(1..16),
      addressDetail: Faker::Address.street_address,
      phone: get_phone,
      gender: [0, 1].sample,
      birthday: Faker::Date.between(from: 60.years.ago, to: 30.years.ago),
      registerday: Faker::Date.between(from: 10.days.ago, to: Date.today),
      profile: File.open("#{Rails.root}/public/photos/user#{rand(3) + 1}.jpg"),
      remarks: get_description,
      dharmaName: DHARMA_NAMES.sample,
    }
    User.create(object_hash)
    puts "USER 생성"
  end
end

def generate_believers
  100.times do |index|
    object_hash = {
      temple_id: Temple.all.sample.id,
      name: Faker::Name.name.delete(' '),
      addressProvince: rand(1..16),
      addressDetail: Faker::Address.street_address,
      phone: get_phone,
      gender: [0, 1].sample,
      birthday: Faker::Date.between(from: 70.years.ago, to: 20.years.ago),
      registerday: Faker::Date.between(from: 10.days.ago, to: Date.today),
      profile: File.open("#{Rails.root}/public/photos/user#{rand(1..3)}.jpg"),
      remarks: get_description,
      email: Faker::Internet.email,
      ganzhi: "갑자생",
      dharmaName: rand() > 0.6 ? DHARMA_NAMES.sample : nil,
    }
    Believer.create(object_hash)
    puts "Believer 생성"
  end
end

def generate_prays
  50.times do |index|
    isMyPray = rand() < 0.7
    pray_believer = Believer.all.sample
    start_day = Faker::Date.between(from: 1.year.ago, to: Date.today)
    finish_day = Faker::Date.between(from: start_day, to: start_day + 1.year)
    object_hash = {
      temple_id: Temple.all.sample.id,
      buddha_id: Buddha.all.sample.id,
      believer_id: pray_believer.id,
      donator: isMyPray ? pray_believer.name : Faker::Name.name,
      prayerRelation: isMyPray ? "본인" : "지인",
      prayerName: isMyPray ? pray_believer.name : Faker::Name.name,
      prayerBirthyear: isMyPray ? pray_believer.ganzhi : "갑자생",
      prayerAddress: isMyPray ? pray_believer.addressProvince + pray_believer.addressDetail : Faker::Address.street_address,
      prayerPhone: isMyPray ? pray_believer.phone : get_phone,
      startDay: start_day,
      finishDay: finish_day,
      fullPayDay: finish_day < Date.today ? (rand() < 0.5 ? start_day : finish_day) : nil,
      isPrayFinished: finish_day < Date.today,
      isFinishConfirmed: finish_day > Date.today && finish_day < 30.days.from_now,
      remarks: get_description,
    }
    pray = Pray.create(object_hash)
    puts "Pray 생성"

    request_num = [1,2,3].sample
    request_num.times do |num|
      request_day = num < 1 ? start_day : Faker::Date.between(from: start_day, to: finish_day)
      pray.pray_requests.create({ requestDay: request_day, request: Faker::Lorem.sentence(word_count: 10), remarks: get_description })
      puts "발원도 생성"
    end

    donate_day = start_day
    loop do
      if donate_day > finish_day or donate_day > Date.today
        break
      end
      puts "입금기록도 생성"
      pray.pray_donations.create({ donateDay: donate_day, donation: 100000, remarks: rand() < 0.2 ? "00은행 입금" : nil })
      donate_day = donate_day + 1.month
    end
  end
end

def generate_offers
  50.times do |index|
    isMyPray = rand() < 0.7
    offer_believer = Believer.all.sample
    object_hash = {
      temple_id: Temple.all.sample.id,
      buddha_id: Buddha.all.sample.id,
      believer_id: offer_believer.id,
      donator: isMyPray ? offer_believer.name : Faker::Name.name,
      offerorRelation: isMyPray ? "본인" : "지인",
      offerorName: isMyPray ? offer_believer.name : Faker::Name.name,
      offerorBirthyear: isMyPray ? offer_believer.ganzhi : "갑자생",
      offerorAddress: isMyPray ? offer_believer.addressProvince + offer_believer.addressDetail : Faker::Address.street_address,
      offerorPhone: isMyPray ? offer_believer.phone : get_phone,
      offerDay: Faker::Date.between(from: 1.year.ago, to: Date.today),
      request: get_description,
      remarks: get_description,
    }
    Offering.create(object_hash)
    puts "Offer 생성"  
  end
end

generate_buddhas
generate_temples
generate_users
generate_believers
generate_prays
generate_offers

