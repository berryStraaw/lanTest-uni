# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    Rails.logger.debug "------------------------test----------------------------------"
    
    @tests = Test.where(user_id: current_user.id)
  end

  def show
    @test = Test.find(params[:id])
    @group = Group.find(@test.group_id)
  end

  def edit
    # Logic to display the profile edit form
  end

  def update_input
    @test = Test.find(params[:id])
    if @test.update(input: params[:test][:input])
      # Handle successful update (e.g., redirect, flash message)
      redirect_to performance_path(@test), notice: 'Inputs updated successfully!'
    else
      # Handle error (e.g., re-render form, show error message)
      render :show
    end
  end

  def create
    Rails.logger.debug '---------------------------Test contrtoller-------------------------------'
    @group = Group.find(params[:test][:group_id])
    words = @group.words
    questions = []
    answers = []
    words.each do |word|
      questions << word.name
      answers << word.meaning
    end
    @test = Test.new(test_params)
    @test.questions = questions
    @test.answers = answers

    words.each do |word|
      word.tests << @test
    end
    @test.groups << @group
    # @test.questions=@group.words
    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  private

  def test_params
    params.require(:test).permit(:user_id, :group_id) # Add any other group parameters
  end
end
