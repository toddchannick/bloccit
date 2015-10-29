class Api::V1::BaseController < ApplicationController
   skip_before_action :verify_authenticity_token

   #whenever these ActiveRecord errors occur, we will 'rescue' with our own defined methods
   rescue_from ActiveRecord::RecordNotFound, with: :not_found
   rescue_from ActionController::ParameterMissing, with: :malformed_request

   #check request for auth. headers and pass to proceeding block. then use token to set current_user
   def authenticate_user
     authenticate_or_request_with_http_token do |token, options|
       @current_user = User.find_by(auth_token: token)
     end
   end

   #check that current user is set and that they are an admin. If not an admin, then NO ACCESS TO API
   def authorize_user
     unless @current_user && @current_user.admin?
       render json: {error: "Not Authorized", status: 403}, status: 403
     end
   end

   def malformed_request
     render json: {error: "The request could not be understood by the server due to malformed syntax. The client SHOULD NOT repeat the request without modifications.", status: 400}, status: 400
   end

   def not_found
     render json: {error: "Record not found", status: 404}, status: 404
   end
 end
