require_relative 'spec_helper'
require_relative '../lib/util.rb'

RSpec.describe 'tests CSV util library' do

    FILE_PATH = '/Users/oliviamo/sites/rspec_test/data/users.csv'
    BAD_FILE_PATH = '/Users/oliviamo/sites/rspec_test/data/bad_users.csv'

    # write methods that pass these tests
    # any errors throughout util should return nil

    it 'should return nil if file is missing' do
        expect(Util.read_csv_file'' ).to eq(nil)
        expect(Util.read_csv_file './apple.rb' ).to eq(nil)
    end


    it 'should read first line only' do
        expected_result = "1,Sissie,Caldecott,scaldecott0@yolasite.com,Female,112.164.157.133"
        first_line = Util.read_first_line(FILE_PATH)
        expect(first_line).to eq(expected_result)
    end

    it 'should return nil if csv file corrupt (not raise)' do
        expect(Util.read_first_line(BAD_FILE_PATH)).to eq(nil)
    end

    it 'should add to csv and read last line only' do
      entry = {
         id: 101,
         first_name: 'Ruegen',
         last_name: 'Aschenbrenner',
         email: 'ruegen.aschenbrenner@coderacademy.edu.au',
         gender: 'Male',
         ip_address: '192.168.1.1'
       }
      expected_result = "101,Ruegen,Aschenbrenner,ruegen.aschenbrenner@coderacademy.edu.au,Male,192.168.1.1"
      Util.add_entry(entry, FILE_PATH)
      expect(Util.check_last_line(FILE_PATH)).to eq(expected_result)
    end

    # it 'should delete the last line' do
    #   expected_result = '100,Hadley,McDermott-Row,hmcdermottrow2r@samsung.com,Male,90.147.108.44'
    #   last_line = Util.delete_last_line(FILE_PATH)
    #   expect(last_line).to eq(expected_result)
    # end



    # Challenge 2 - write your own tests

    # add this person to the csv and expect them to be the last line
    #  {
    #      id: 101,
    #      first_name: 'Ruegen',
    #      last_name: 'Aschenbrenner',
    #      email: 'ruegen.aschenbrenner@coderacademy.edu.au',
    #      gender: 'Male',
    #      ip_address: '192.168.1.1'
    #  }

    # delete the last line

    # return nil if you ask for a header that doesn't exist (id, first_name etc)


end
