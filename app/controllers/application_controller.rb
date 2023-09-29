class ApplicationController < ActionController::Base
    before_action :redirect_to_job_offers

    private

    def after_sign_in_path_for(_resource)
      job_offers_path
    end

    def redirect_to_job_offers
      return unless user_signed_in? && request.path == root_path

      redirect_to job_offers_path
    end
end
