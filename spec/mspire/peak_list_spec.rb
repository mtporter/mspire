require 'spec_helper'

require 'mspire/peak_list'
require 'mspire/peak'

describe Mspire::PeakList do

  describe '#split' do

    before do
      # xs could be m/z values or retention times
      simple = [ 0, 3, 8, 9, 7, 2, 0 ]
      multi_large1 = [ 0, 3, 8, 2, 9, 7, 1, 3, 0 ]
      multi_large2 = [ 0, 10, 8, 2, 9, 7, 1, 3, 0 ]
      doublet = [ 0, 10, 8, 0 ]

      start_mz = 50
      @intensities = simple + multi_large1 + multi_large2 + doublet
      @xs = []
      mz = start_mz
      diff = 0.01
      loop do
        @xs << mz
        break if @xs.size == @intensities.size
        mz += diff
      end
      @xs.map! {|mz| mz.round(2) }
      @peaks = @xs.zip(@intensities)
    end

    it 'outlines peak boundaries' do

      peaklist = Mspire::PeakList[[5.08, 3]]
      boundaries = peaklist.peak_boundaries
      boundaries.should == [[0,0]]

      peaklist = Mspire::PeakList[[5.08, 3], [5.09, 8]]
      boundaries = peaklist.peak_boundaries
      boundaries.should == [[0,1]]

      peaklist = Mspire::PeakList[*@peaks]
      boundaries = peaklist.peak_boundaries
      #                      5        8     10       13 14       17     19       22 23       26  27
      #act = [0, 3, 8, 9, 7, 2, 0, 0, 3, 8, 2, 9, 7, 1, 3, 0, 0, 10, 8, 2, 9, 7, 1, 3, 0, 0, 10, 8, 0] 
      boundaries.should == [[1, 5], [8, 10, 13, 14], [17, 19, 22, 23], [26, 27]]

      # another case that was failing early on:
      peaklist = Mspire::PeakList[[5.08, 3], [5.09, 8], [5.1, 2], [5.11, 9], [5.12, 7], [5.13, 1], [5.14, 3]]
      boundaries = peaklist.peak_boundaries
      boundaries.should == [[0,2,5,6]]
    end

    it 'splits on zeros by default' do
      peaklist = Mspire::PeakList[*@peaks] # <- maybe more like a collection of peaks, but PeakList is flexible
      split_peaklist = peaklist.split
      split_peaklist.size.should == 4
      split_peaklist.should == [
        [[50.01, 3], [50.02, 8], [50.03, 9], [50.04, 7], [50.05, 2]],
        [[50.08, 3], [50.09, 8], [50.1, 2], [50.11, 9], [50.12, 7], [50.13, 1], [50.14, 3]],
        [[50.17, 10], [50.18, 8], [50.19, 2], [50.2, 9], [50.21, 7], [50.22, 1], [50.23, 3]],
        [[50.26, 10], [50.27, 8]]
      ]
    end

    # which it should since zeros are the ultimate local min!
    it 'always cleans up surrounding zeros and does not split non-multipeaks' do
      peak = Mspire::PeakList[*@peaks[0,7]]  # simple
      [:share, :greedy_y].each do |multipeak_split_method|
        peaks = peak.split(multipeak_split_method)
        peaks.first.should be_an_instance_of(Mspire::PeakList)
        peaks.first.to_a.should == [[50.01, 3], [50.02, 8], [50.03, 9], [50.04, 7], [50.05, 2]]
      end
    end

    describe 'splitting a peak_list that is a multipeak' do
      subject do
        Mspire::PeakList[[50.07, 0], [50.08, 3], [50.09, 8], [50.1, 2], [50.11, 9], [50.12, 7], [50.13, 1], [50.14, 3], [50.15, 0]]
      end

      it 'can split a multipeak' do
        multipeak = Mspire::PeakList[[5.08, 3], [5.09, 8]]
        peaklists = multipeak.split_contiguous(:greedy_y)
        peaklists.should == [[5.08, 3], [5.09, 8]]

        multipeak = Mspire::PeakList[[5.08, 3]]
        peaklists = multipeak.split_contiguous(:greedy_y)
        peaklists.should == [[5.08, 3]]

        multipeak = Mspire::PeakList[[5.08, 3], [5.09, 8], [5.1, 2], [5.11, 9], [5.12, 7], [5.13, 1], [5.14, 3]]
        peaklists = multipeak.split_contiguous(:greedy_y)
        peaklists.all? {|pl| pl.should be_a(Mspire::PeakList) }
        peaklists.should == [[[5.08, 3], [5.09, 8]], [[5.1, 2], [5.11, 9], [5.12, 7], [5.13, 1]], [[5.14, 3]]]

        multipeak = Mspire::PeakList[[5.08, 3], [5.09, 8], [5.1, 2], [5.11, 9], [5.12, 7], [5.13, 1], [5.14, 3]]
        peaklists = multipeak.split_contiguous(:share)
        peaklists.all? {|pl| pl.should be_a(Mspire::PeakList) }
        peaklists.should == [[[5.08, 3], [5.09, 8], [5.1, 2*(8.0/17)]], [[5.1, 2*(9.0/17)], [5.11, 9], [5.12, 7], [5.13, 7.0/10]], [[5.13, 3.0/10], [5.14, 3]]]

      end

      it 'does #split(:share) and shares the peak proportional to adjacent peaks' do
        answer = [
          [[50.08, 3], [50.09, 8], [50.1, (2*8.0/17)]], 
          [[50.1, 2*9.0/17], [50.11, 9], [50.12, 7], [50.13, 0.7]],
          [[50.13, 0.3], [50.14, 3]]
        ]
        subject.split(:share).should == answer
      end

      it 'does #split(:greedy_y) and gives the local min to highest adjacent peak' do

        answer = [
          [[50.08, 3], [50.09, 8]], 
          [[50.1, 2], [50.11, 9], [50.12, 7], [50.13, 1]], 
          [[50.14, 3]]
        ]
        subject.split(:greedy_y).should == answer

      end

      it '#split splits on whitespace by default' do
        subject[4,0] = [Mspire::Peak.new([50.105, 0])]
        subject.split.should == [[[50.08, 3], [50.09, 8], [50.1, 2]], [[50.11, 9], [50.12, 7], [50.13, 1], [50.14, 3]]]
      end

      it 'gives local min to left peaklist in event of a tie with #split(:greedy_y)' do
        answer = [
          [[50.08, 3], [50.09, 9], [50.1, 2]], 
          [[50.11, 9], [50.12, 7], [50.13, 1]], 
          [[50.14, 3]]
        ]

        # test a tie -> goes left!
        peaks = @peaks[7,9]
        peaks[2] = Mspire::Peak.new([peaks[2][0], 9])
        multipeak2 = Mspire::PeakList[ *peaks ]
        multipeak2.split(:greedy_y).should == answer
      end

    end
  end

  describe '#merge' do

    subject do  

      list1 = [[10.1, 1], [10.5, 2], [10.7, 3], [11.5, 4]].map {|pair| Mspire::Peak.new pair }
      list2 = [[10.11, 5], [10.49, 6], [10.71, 7], [11.48, 8]].map {|pair| Mspire::Peak.new pair }
      list3 = [[10.09, 9], [10.51, 10], [10.72, 11], [11.51, 12]].map {|pair| Mspire::Peak.new pair }

      [list1, list2, list3].map {|peaks| Mspire::PeakList.new( peaks ) }
    end

    it 'whether we ask for data back or not, the peaklist is equal' do
      (peaklist1, data) = Mspire::PeakList.merge(subject, :bin_width => 0.08, :bin_unit => :amu, :return_data => true, :split => false) 
      peaklist2 = Mspire::PeakList.merge(subject, :bin_width => 0.08, :bin_unit => :amu, :split => false)
      peaklist1.should == peaklist2

      peaks = [[10.097333333333331, 10.502222222222223, 10.713809523809525, 11.498333333333333], [5.0, 6.0, 7.0, 8.0]].transpose
      peaklist1.should == Mspire::PeakList.new(peaks)
      data.should == [[[10.1, 1], [10.11, 5], [10.09, 9]], [[10.5, 2], [10.49, 6], [10.51, 10]], [[10.7, 3], [10.71, 7], [10.72, 11]], [[11.5, 4], [11.48, 8], [11.51, 12]]] 

    end

    fail 'still checking this stuff!!!!'

    it 'gives one peak with very large bin width and no :split => false' do
      peak_list, data = Mspire::PeakList.merge(subject, :bin_width => 0.5, :bin_unit => :amu, :return_data => true)
      p peak_list
      data.should == [[[10.1, 1], [10.5, 2], [10.11, 5], [10.49, 6], [10.09, 9], [10.51, 10], [10.7, 3], [10.71, 7], [10.72, 11]], [[10.7, 3], [10.71, 7], [10.72, 11], [11.5, 4], [11.48, 8], [11.51, 12]]]
    end

    it 'gives multiple peaks with large bin width and splitting' do
      data = Mspire::PeakList.merge(subject, :bin_width => 0.1, :bin_unit => :amu, :only_data => true, :split => :greedy_y)
      # frozen, not checked exactly:
      data.should == [[[10.1, 1], [10.11, 5], [10.09, 9]], [[10.5, 2], [10.49, 6], [10.51, 10]], [[10.7, 3], [10.71, 7], [10.72, 11]], [[11.48, 8], [11.5, 4], [11.51, 12]]]
    end

=begin
      data = Mspire::PeakList.merge(subject, :bin_width => 1000, :bin_unit => :ppm, :only_data => true)
      # just frozen, and checking for sanity, not checked for perfect, accuracy at this level:
      data.should == [[[10.09, 9]], [[10.1, 1]], [[10.11, 5]], [[10.49, 6]], [[10.5, 2]], [[10.51, 10]], [[10.7, 3]], [[10.71, 7]], [[10.72, 11]], [[11.48, 8]], [[11.5, 4]], [[11.51, 12]]]

      [[[10.1, 1], [10.09, 9], [10.11, 5]], [[10.49, 6], [10.5, 2]], [[10.5, 2], [10.51, 10]], [[10.7, 3], [10.71, 7], [10.72, 11]], [[11.48, 8], [11.5, 4]], [[11.5, 4], [11.51, 12]]]
      #peaklist3 = Mspire::PeakList.merge(subject, :bin_width => 100, :bin_unit => :ppm)
      #p peaklist3
      peaklist4 = Mspire::PeakList.merge(subject, :bin_width => 1000, :bin_unit => :ppm, :normalize => false)
      peaklist4.should == [[10.097333333333331, 15.0], [10.49111111111111, 6.75], [10.508888888888887, 11.25], [10.713809523809525, 21.0], [11.483333333333334, 9.6], [11.508333333333331, 14.4]] 
=end


  end

end

