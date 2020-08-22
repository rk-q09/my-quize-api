class Api::V1::QuestionsController < ApplicationController
    def create
      quize = Quize.find(params[:id])
      question = quize.questions.new(
        content: params['content']
      )
      if question.save
        render json: {
          status: :created,
          id: question.id
        }
      else
        render json: {errors: question.errors.full_messages}
      end
    end
end
