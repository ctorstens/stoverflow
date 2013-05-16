class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params[:answer])
    redirect_to question_path(@answer.question)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to questions_path
  end

end