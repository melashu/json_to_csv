require 'rails_helper'

# frozen_string_literal: true

RSpec.describe 'Converts', type: :request do
  describe 'Converts#index' do
    context 'When we pass invalid json format to /convert' do
      it 'should return unprocessable entity status code' do
        post '/convert', params: { data: 'Meshu' }
        expect(response).to have_http_status(422)
        expect(response.body).to eq('Either the id is duplicted or invalid format,try /convert/previous to see previous data')
      end
    end
    context 'When we pass array of object data' do
      it 'should return data in CSV format' do
        post '/convert', params: {
          data: [
            { fname: 'Norbert', lname: 'Szivós', salary: 4000, company: 'Radar Cyber Security', position: 'Rails devloper' }
            ]
        }
        expect(response.body).to eq("fname,lname,company,position,salary\nNorbert,Szivós,Radar Cyber Security,Rails devloper,4000")
      end
    end
  end
  describe 'Converts#previous' do
    context 'When we send get request to /convert/previous' do
      it 'should return data in CSV format' do
        get '/convert/previous'
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
