module SessionAction
	extend ActiveSupport::Concern
	def require_login
		unless user_signed_in?
			logger.info 'Need login'
			redirect_to root_path
		end
	end
end
