module Memberable
  extend ActiveSupport::Concern

  included do
    enum gender: %i(male female)
    enum addressProvince: {
      seoul: 1,
      busan: 2, 
      daejeon: 3,
      daegu: 4, 
      ulsan: 5,
      incheon: 6,
      gwangju: 7,
      sejong: 8,
      gyeonggido: 9,
      gangwondo: 10,
      chungcheongbukdo: 11,
      chungcheongnamdo: 12,
      jeonllabukdo: 13,
      jeonllanamdo: 14,
      gyeongsangbukdo: 15,
      gyeongsangnamdo: 16,
      jejudo: 17,
      japan: 18,
      america: 19,
      others: 20,
    }
  end
end