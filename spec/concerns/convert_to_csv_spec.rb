require 'rails_helper'

# frozen_string_literal: true

RSpec.describe 'ConvertToCsv' do
  before :all do
    @convert = DummyConvert.new
  end
  context 'When we pass empty array' do
    it 'it should return no data available ' do
      expect(@convert.convert_to_csv([])).to eq('No data avaliable')
    end
  end

  context 'When we pass normal string' do
    it 'it should return We expect array of hash' do
      expect(@convert.convert_to_csv('Melashu Amare')).to eq('We expect array of hash')
    end
  end
  context 'When we pass array of hash' do
    data = [{
      fname: 'Norbert',
      lname: 'Szivós'
    }]
    it 'it should return data in CSV format' do
      expect(@convert.convert_to_csv(data)).to eq("fname,lname\nNorbert,Szivós")
    end
  end
end

class DummyConvert < ApplicationController
  include ConvertToCsv
end
