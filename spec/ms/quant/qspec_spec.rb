require 'spec_helper'

require 'ms/quant/qspec'
require 'csv'

describe 'running qspec' do 
  before do
    @file = TESTFILES + '/ms/quant/max_quant_output.txt'
    rows = IO.readlines(@file).map {|line| line.chomp.split("\t") }
    p rows.map(&:size)
    abort 'here'
    #columns = IO.readlines(@file).map {|line| line.split("\t") }.transpose
    headers = columns.map(&:first)
    p headers
  end

  describe 'on spectral count data' do
    it 'works' do
      1.should == 1
    end
  end

  describe 'on MaxQuant LFQ data' do
  end
end
