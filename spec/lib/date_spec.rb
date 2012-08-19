# encoding: UTF-8
require 'spec_helper'
require './lib/date'

describe Date do
  describe "#ganji" do
    it "should convert date to ganji" do
      # 1391-02-05 (일)  1391-01-01  신미(辛未)년 경인(庚寅)월 기축(己丑)일
      Date.parse("1391-02-05").ganji.should == "기축"

      # 1883-03-06 (화)  1883-01-27  계미(癸未)년 갑인(甲寅)월 기유(己酉)일
      Date.parse("1883-03-06").ganji.should == "기유"

      # 2012-08-01 (수)  2012-06-14  임진(壬辰)년 정미(丁未)월 갑오(甲午)일
      Date.parse("2012-08-01").ganji.should == "갑오"

      # 2050-12-31 (토)  2050-11-18  경오(庚午)년 무자(戊子)월 을유(乙酉)일
      Date.parse("2050-12-31").ganji.should == "을유"
    end
  end
end