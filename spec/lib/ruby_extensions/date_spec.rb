# encoding: UTF-8
require 'spec_helper'
require './lib/ruby_extensions/date'

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

  describe "#solor" do
    it "should parse solor date" do
      Date.solar("2012-12-31").should == Date.parse("2012-12-31")
    end
  end

  describe "#lunar" do
    it "should parse lunar date" do
      # 2012-09-01 (토), 2012-07-15, 임진(壬辰)년 무신(戊申)월 을축(乙丑)일
      Date.lunar("2012-07-15").should == Date.parse("2012-09-01")

      # 2012-09-30 (일), 2012-08-15, 임진(壬辰)년 기유(己酉)월 갑오(甲午)일
      Date.lunar("2012-08-15").should == Date.parse("2012-09-30")
    end
  end

  describe "#to_solar" do
    it "should convert lunar to solar date" do
      Date.lunar("2012-07-15").to_solar.should == "2012-09-01"
    end
  end

  describe "#to_lunar" do
    it "should convert solor to lunar date" do
      Date.solar("2012-09-01").to_lunar.should == "2012-07-15"
      Date.solar("2012-09-30").to_lunar.should == "2012-08-15"
    end
  end
end