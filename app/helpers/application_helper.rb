module ApplicationHelper
	def header(text)
	  content_for(:header) { text.to_s }
	end

def resource_name
    :user
end

def resource
    @resource ||= User.new
end

def resource_class 
    User 
end

def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
	end_mapping ||= Devise.mappings[:user]
  end

   def current_user?(user)
     user == current_user
  end


end
