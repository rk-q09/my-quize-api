class Api::V1::ChoicesController < ApplicationController
    def create
        question = Question.find(params[:id])
        choices = question.choices.create!(
          content: params['content'],
          is_answer: params["is_answer"]
        )
        if choices
            render json: choices
        else
            render json: {errors: choices.errors.full_messages}
        end
    end
  end
  