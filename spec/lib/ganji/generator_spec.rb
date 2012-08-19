# encoding: UTF-8
require 'spec_helper'
require './lib/ganji/generator'

describe Ganji::Generator do
  class MockBook
    attr_reader :stored

    def initialize
      @stored = []
    end

    def insert(*params)
      @stored << params
    end

    def write(filename)
    end
  end

  describe "#generate" do
    it "should generate ganji calender" do
      book = MockBook.new
      from = Date.parse("2012-01-01")
      to = Date.parse("2012-01-03")

      Ganji::Generator.any_instance.stub(:make_book) { book }

      generator = Ganji::Generator.new
      generator.generate(from, to, "")

      book.stored.should == [[2012, 0, 0, "신유"], [2012, 1, 0, "임술"], [2012, 2, 0, "계해"]]
    end
  end
end