require 'rails_helper'

# frozen_string_literal: true

RSpec.describe 'CreateEmployee' do
  before :all do
    @employe = DummyConvert.new
  end
  context 'When we create valid user' do
    data = { fname: 'Meshu', lname: 'Amare', salary: 2300, company: 'xy', position: 'Rails devloper' }
    it 'it should return true' do
      expect(@employe.create_employee?(data)).to be_truthy
    end
  end
  context 'When we pass invalid attribute' do
    data = [{ first_name: 'Meshu', lname: 'Amare', salary: 2300, company: 'xy', position: 'Rails devloper' }]
    it 'it should return false' do
      expect(@employe.create_employee?(data)).to be_falsey
    end
  end
  context 'When attribute is missed' do
    it 'it should return false' do
      expect(@employe.create_employee?({ lname: 'Amare', salary: 2300, company: 'xy', position: 'Rails devloper' })).to be_falsey
      expect(@employe.create_employee?({ fname: 'Meshu', salary: 2300, company: 'xy', position: 'Rails devloper' })).to be_falsey
      expect(@employe.create_employee?({ fname: 'Meshu', lname: 'Amare', company: 'xy', position: 'Rails devloper' })).to be_falsey
      expect(@employe.create_employee?({ fname: 'Meshu', lname: 'Amare', salary: 2300, position: 'Rails devloper' })).to be_falsey
      expect(@employe.create_employee?({ fname: 'Meshu', lname: 'Amare', salary: 2300, company: 'xy' })).to be_falsey
    end
  end
end

class DummyConvert < ApplicationController
  include CreateEmployee
end
