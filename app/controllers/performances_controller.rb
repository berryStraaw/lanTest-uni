# frozen_string_literal: true

class PerformancesController < ApplicationController
  def index
    tests=current_user.tests
    Rails.logger.debug "------------------------perf----------------------------------"
    Rails.logger.debug tests
    Rails.logger.debug tests.inspect
    Rails.logger.debug "------------------------end----------------------------------"
    @data_path = average_scores_by_day(tests)
  end

  
  def show
    @test = Test.find(params[:id])
    @answers = @test.answers
    @questions = @test.questions
    @input = @test.input

    @correct_answers = 0
    # Rails.logger.debug "------------------------Calcs----------------------------------"
    @answers.each_with_index do |answer, index|
      @correct_answers += 1 if answer == @input[index]
    end
  end

  def chart_data
    # Fetch or compute the data as per your requirements
    data_path = {
      "2023-07-27" => 50,
      "2023-07-28" => 60,
      "2023-07-29" => 75,
      # ... and so on
    }
  
  end

  def calculate_score(test)
    correct_answers = test.input.zip(test.answers).count { |input, answer| input == answer }
    (correct_answers.to_f / test.answers.size) * 100
  end

  def average_scores_by_day(tests)
    grouped_tests = tests.group_by { |test| test.updated_at.to_date }
    grouped_tests.transform_values do |tests_on_date|
      total_scores = tests_on_date.sum { |test| calculate_score(test) }
      (total_scores.to_f / tests_on_date.size).round
    end
  end

  
  
end
