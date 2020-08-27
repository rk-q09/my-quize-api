class  Api::V1::RegistrationsController < ApplicationController
    def create
      user = User.new(
        user_name: params['user']['user_name'],
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation']
      )

      if user.save
        render json: {
          status: :created,
          messages: "Successfully Created",
          user: user
        }
      else
        render json: { errors: user.errors.full_messages }
      end
    end
  end
