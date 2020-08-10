class Api::V1::QuizesController < ApplicationController

    def index
        user = User.find(params[:id])
        quizes = user.quizes
        render json: quizes, include: []
    end

    def show
      quize = Quize.find(params[:id])
      render json: quize, include: 'questions.choices'
    end

    def create
        user = User.find(params[:id])
        quize = user.quizes.create!(
          title: params['title']
        )
        if quize
            render json: {
              id: quize.id,
              title: quize.title
            }
        else
            render json: {errors: quize.errors.full_messages}
        end
    end

    def destroy
      quize = Quize.find(params[:id])
      if quize.destroy
        render json: {status: 200}
      else
        render json: {errors: quize.erros.full_messages}
      end
    end
end
