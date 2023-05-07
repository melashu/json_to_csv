require 'rails_helper'

# frozen_string_literal: true

RSpec.describe 'CreateEmployee' do
  before :all do
    @employe = DummyConvert.new
  end
  context 'When we create valid user' do
    data = { fname: 'Meshu', lname: 'Amare', salary: 2300, company: 'Radar Cyber Security', position: 'Rails devloper' }
    it 'it should return true' do
      expect(@employe.create_employee?(data)).to be_truthy
    end
  end
  context 'When we pass invalid attribute' do
    data = [{ first_name: 'Meshu', lname: 'Amare', salary: 2300, company: 'Radar Cyber Security', position: 'Rails devloper' }]
    it 'it should return false' do
      expect(@employe.create_employee?(data)).to be_falsey
    end
  end
  context 'When attribute is missed' do
    it 'it should return false' do
      data1 = { lname: 'Amare', salary: 2300, company: 'Radar Cyber Security', position: 'Rails devloper' }
      data2 = { fname: 'Meshu', salary: 2300, company: 'Radar Cyber Security', position: 'Rails devloper' }
      data3 = { fname: 'Meshu', lname: 'Amare', company: 'Radar Cyber Security', position: 'Rails devloper' }
      data4 = { fname: 'Meshu', lname: 'Amare', salary: 2300, position: 'Rails devloper' }
      data5 = { fname: 'Meshu', lname: 'Amare', salary: 2300, company: 'Radar Cyber Security' }
      expect(@employe.create_employee?(data1)).to be_falsey
      expect(@employe.create_employee?(data2)).to be_falsey
      expect(@employe.create_employee?(data3)).to be_falsey
      expect(@employe.create_employee?(data4)).to be_falsey
      expect(@employe.create_employee?(data5)).to be_falsey
    end
  end
end

class DummyConvert < ApplicationController
  include CreateEmployee
end
