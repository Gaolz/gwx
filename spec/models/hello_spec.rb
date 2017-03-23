# encoding : utf-8
require 'rails_helper'

describe do
   it "returns canned responses from the methods named in the provided hash" do
        dbl = double("Some Collaborator", :foo => 3, :bar => 4)
        expect(dbl.foo).to eq(3)
        expect(dbl.bar).to eq(4)
    end 
end