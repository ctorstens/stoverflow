require 'spec_helper'

describe Question do
  let(:question) { Question.create(title: "My first question", content: "Help me figure this out") }

  context "valid input" do

    it "should create a question instance given valid attributes" do
      question.should be_instance_of Question
    end

    it "should have a title" do
      question.title.should eq "My first question"
    end

    it "should have content" do
      question.content.should eq "Help me figure this out"
    end
  end

  context "invalid input" do
    let(:bad_question) { Question.create(title: "", content: "") }
    it "should not create a question instance given valid attributes" do
      bad_question.should_not be_valid
    end
  end
end