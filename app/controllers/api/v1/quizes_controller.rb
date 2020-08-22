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
        quize = user.quizes.new(
          title: params['title']
        )
        if quize.save
            render json: {
              status: :created,
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
        render json: {errors: quize.errors.full_messages}
      end
    end

    def get_user_id
      quize = Quize.find_by(id: params[:quize_id])
      render json: {
        user_id: quize.user.id
      }
    end

    def new_quizes
      quizes = Quize.order(created_at: :desc).limit(3)
      render json: quizes, include: []
    end
end
