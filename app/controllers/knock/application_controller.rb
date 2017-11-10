module Knock
  class ApplicationController < ActionController::Base
    rescue_from Knock.not_found_exception_class_name, with: :not_found

  private

    def not_found
      render json: { errors: 'Unauthorized!' }, status: :unauthorized
    end
  end
end
