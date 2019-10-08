class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Exception,                           with: :render_error
  rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
  rescue_from ActionController::RoutingError,      with: :render_not_found
  rescue_from AbstractController::ActionNotFound,  with: :render_not_found
  rescue_from ActionController::ParameterMissing,  with: :render_parameter_missing

  def status
    render json: { online: true }
  end

  private

  def render_error(exception)
    raise exception if Rails.env.test?

    # To properly handle RecordNotFound errors in views
    return render_not_found(exception) if exception.cause.is_a?(ActiveRecord::RecordNotFound)

    logger.error(exception) # Report to your error managment tool here

    return if performed?

    render json: { error: e }, status: :internal_server_error
  end

  def render_not_found(exception)
    logger.info(exception) # for logging
    render json: { error: e }, status: :not_found
  end

  def render_record_invalid(exception)
    logger.info(exception) # for logging
    render json: { errors: exception.record.errors.as_json }, status: :bad_request
  end

  def render_parameter_missing(exception)
    logger.info(exception) # for logging
    render json: { error: e }, status: :unprocessable_entity
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:gender])
  end
end
