class Api::V1::ChoicesController < ApplicationController
    def create
        question = Question.find(params[:id])
        choices = question.choices.new(
          content: params['content'],
          is_answer: params["is_answer"]
        )
        if choices.save
            render json: {
              status: :created,
              choices: choices
            }
        else
            render json: {errors: choices.errors.full_messages}
        end
    end
  end
