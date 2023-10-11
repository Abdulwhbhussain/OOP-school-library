require_relative '../classes/rental.rb'
require_relative '../classes/book.rb'
require_relative '../classes/person.rb'
require 'rspec'

describe Rental do
    before(:each) do
        @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
        @person = Person.new(22)
        @person.id = 4
        @rental = Rental.new('2023-10-11', @book, @person)
    end

    describe '#initialize' do
        it 'should check the date' do
            expect(@rental.date).to eq('2023-10-11')
        end

        it 'should check for the book title' do
            expect(@rental.book.title).to eq('The Great Gatsby')
        end

        it 'should check for the book author' do
            expect(@rental.book.author).to eq('F. Scott Fitzgerald')
        end

        it 'Should check for the age' do
            expect(@rental.person.age).to eq(22)
        end

        it 'Should check for the name' do
            expect(@rental.person.name).to eq('Unknown')
        end

        it 'Should check for the parent permission' do
            expect(@rental.person.parent_permission).to eq(true)
        end
    end

    #describe '#to_json' do
    #    it 'SHould check the string version of the rental object' do
    #        expect(@rental.to_json).to eq('{"date":"2023-10-11","book":{"title":"The Great Gatsby","author":"F. Scott Fitzgerald"},"person":{"id":4,"name":"Unknown","age":22,"parent_permission":true,"classroom":null}}')
    #    end
    #end
end
