require_relative '../classes/base_decorator.rb'
require 'rspec'

describe BaseDecorator do
    before(:each) do
        @base_decorator = BaseDecorator.new('testNameableName')
    end

    describe '#initialize' do
        it 'should check for nameable' do
            expect(@base_decorator.nameable).to eq('testNameableName')
        end
    end

    #describe '#correct_name' do
    #    it 'should raise an error' do
    #      expect { @base_decorator.correct_name }.to raise_error(NotImplementedError)
    #    end
    #end

    #describe '#correct_name' do
    #    it 'should check the return of correct_name method' do
    #        expect(@base_decorator.correct_name).to eq('testNameableName')
    #    end
    #end
end
