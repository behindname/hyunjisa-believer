# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# AdminUser.create!(email: 'behindname@naver.com', password: 'qjqghkrud1!', password_confirmation: 'qjqghkrud1!')


def generate_temples
  # 서울 = 1, 춘천본사 = 2, 부산분원 = 3, /*영산불교대학 = 4,*/ 대전분원 = 5, 고성분원 = 6, 제주2본산 = 7, 일본분원 = 8, 대구분원 = 9
  %w(춘천본사
  제주제2본산
  김해분원
  대전분원
  대구분원
  고성분원
  일본분원).each_with_index do |local_temple, index|
    Temple.create(place: local_temple, position: index)
  end
end

# generate_temples