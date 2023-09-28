class ApplicationController < ActionController::Base
    before_action :redirect_to_jobs

    private

    def after_sign_in_path_for(_resource)
      jobs_path
    end

    def redirect_to_jobs
      return unless user_signed_in? && request.path == root_path

      redirect_to jobs_path
    end
end
