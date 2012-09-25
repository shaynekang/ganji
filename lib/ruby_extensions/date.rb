# encoding: UTF-8
require 'csv'

class Date
  # 갑(甲), 을(乙), 병(丙), 정(丁), 무(戊), 기(己), 경(庚), 신(辛), 임(壬), 계(癸)
  # Jikkan = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
  Jikkan = ["갑", "을", "병", "정", "무", "기", "경", "신", "임", "계"]

  # 자(子), 축(丑), 인(寅), 묘(卯), 진(辰), 사(巳), 오(午), 미(未), 신(申), 유(酉), 술(戌), 해(亥)
  # Junishi = ["寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥", "子", "丑"]
  Junishi = ["인", "묘", "진", "사", "오", "미", "신", "유", "술", "해", "자", "축"]

  #十干(십간)
  def jikkan
    Jikkan[self.mjd%10]
  end

  #十二支(십이지)
  def junishi
    Junishi[self.mjd%12]
  end

  def ganji
    jikkan + junishi
  end

  class << self
    def solar(date)
      parse(date)
    end

    def lunar(date)
      # year, month, day = date.split('-')
      # CSV.foreach("data/#{year}-#{month}.txt") do |row|
      CSV.foreach("data/ganji.csv") do |row|
        return parse(row[0]) if date == row[1]
      end
    end
  end

  def to_solar
    to_s
  end
  
  def to_lunar
    date = self.to_s
    CSV.foreach("data/ganji.csv") do |row|
      return row[1] if date == row[0].gsub(/\s\((.+)/, '')
    end
  end
end