require 'rails_helper'
# frozen_string_literal: true

RSpec.describe 'ModelToHash' do
  before :all do
    Employee.create([{ fname: 'Meshu', lname: 'Amare', salary: 2300, company: 'xy', position: 'Rails devloper' }])
    @employe = DummyConvert.new
  end
  context 'When ActiveRecord relation is fetched' do
    it 'it should return array of hash' do
      data = @employe.model_object_to_ruby_hash
      expect(data.is_a?(Array)).to be_truthy
      expect(data.all? {| emp | emp.is_a?(Hash) }).to be_truthy
      expect(data[0].keys.join(',')).to eq('id,fname,lname,salary,company,position')
    end
  end
end

class DummyConvert < ApplicationController
  include ModelToHash
end
