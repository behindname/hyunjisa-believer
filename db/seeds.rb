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
TEMPLE_LIST = %w(춘천본사 제주제2본산 김해분원 대전분원 대구분원 고성분원 일본분원)

def get_phone
  "010-#{rand(9000) + 1000}-#{rand(9000) + 1000}"
end

def get_description
  Faker::Lorem.sentence(word_count: 100)
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
      name: "#{Faker::Name.last_name}스님".delete(' '),
      addressProvince: rand(1..16),
      addressDetail: Faker::Address.street_address,
      phone: get_phone,
      gender: [0, 1].sample,
      birthday: Faker::Date.between(from: 60.years.ago, to: 30.years.ago),
      registerday: Faker::Date.between(from: 10.days.ago, to: Date.today),
      profile: File.open("#{Rails.root}/public/photos/user#{rand(3) + 1}.jpg"),
      remarks: get_description,
      dharmaName: Faker::Name.middle_name,      
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
    }
    Believer.create(object_hash)
    puts "Believer 생성"
  end
end

generate_buddhas
generate_temples
generate_users
generate_believers
