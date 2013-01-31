# encoding: utf-8
require 'spec_helper'

describe ScreeningRoom do
  let(:movie_session) { FactoryGirl.build(:movie_session) }
  let(:screening_room) { FactoryGirl.build(:screening_room) }

  subject { screening_room }

  # todo: 测试数据的构造竟然大片的写在spec里，能利用FactoryGirl吗，而且设计到这么多，
  # 随时可能要改
  before do
    keys = screening_room.seats.keys
    status_types = ScreeningRoom.status_types
    @row_name = "A"
    @nil_seat_ori_index = 0
    @nil_seat_index = nil
    @nil_seat_key = "none" 
    @single_seat_ori_index = 1
    @single_seat_index = 3
    @single_seat_key = "A:3"
    @single_seat_title = "A排3座"
  end

  context ".seat_index" do
    it { screening_room.seat_index(@row_name, @nil_seat_ori_index).should == @nil_seat_index }
    it { screening_room.seat_index(@row_name, @single_seat_ori_index).should == @single_seat_index }
  end

  context "#seat_key" do
    let(:nil_seat_ori_index) { screening_room.seat_index(@row_name, @nil_seat_ori_index) }
    let(:single_seat_ori_index) { screening_room.seat_index(@row_name, @single_seat_ori_index) }

    it { ScreeningRoom.seat_key(@row_name, @nil_seat_index).should == @nil_seat_key }
    it { ScreeningRoom.seat_key(@row_name, @single_seat_index).should == @single_seat_key }
  end

  context "#seat_key_to_index" do
    it { ScreeningRoom.seat_key_to_index(@nil_seat_key).should be_nil }
    it { ScreeningRoom.seat_key_to_index(@single_seat_key).should == {row_name: @row_name, seat_index: @single_seat_index} }
  end
end
