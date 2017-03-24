# encoding : utf-8
require 'rails_helper'

class StudentCalculator

    def initialize(course)
        @course = course
    end

    def students_count
        @course.students_count
    end
end

describe do
   it "returns canned responses from the methods named in the provided hash" do
        dbl = double("Some Collaborator", :foo => 3, :bar => 4)
        expect(dbl.foo).to eq(3)
        expect(dbl.bar).to eq(4)
    end

    describe "#students_count" do
        it "returns students count" do
            course = double(students_count: 4)
            student_calculator = StudentCalculator.new(course)
            expect(student_calculator.students_count).to eq 4
        end
    end
end