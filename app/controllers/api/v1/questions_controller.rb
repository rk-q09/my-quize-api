class Api::V1::QuestionsController < ApplicationController
    def create
      quize = Quize.find(params[:id])
      question = quize.questions.create!(
        content: params['content']
      )
      if question
        render json: {
          id: question.id
        }
      else
        render json: {errors: question.errors.full_messages}
      end
    end
end
