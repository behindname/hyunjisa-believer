# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# AdminUser.create!(email: 'behindname@naver.com', password: 'qjqghkrud1!', password_confirmation: 'qjqghkrud1!')


BUDDHA_LIST = ["석가모니불", "문수보살", "보현보살", "다보여래불", "준제보살", "약사여래불", "아미타불",  
  "관세음보살", "대세지보살", "보명여래불", "혜위등왕불", "지장보살", "수미산정 산왕불", "치성광여래불 ",
  "광명불", "무현보살", "모현보살", "자재통왕불", "상행왕 정행왕보살", "현지보살", "화엄성중", "오백나한",  
  "지신재"]

# 서울 = 1, 춘천본사 = 2, 부산분원 = 3, /*영산불교대학 = 4,*/ 대전분원 = 5, 고성분원 = 6, 제주2본산 = 7, 일본분원 = 8, 대구분원 = 9
TEMPLE_LIST = %w(춘천본사 제주제2본산 김해분원 대전분원 대구분원 고성분원 일본분원)

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

# generate_buddhas
# generate_temples
