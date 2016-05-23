module ApplicationHelper

    def article_cover url, options = {}
    
        html_class = options[:class]
        html_style = "background:url(#{url});"\
                   "width:auto;height:500px;padding:370px;background-size:cover;"             
                   
        html = "<header style='#{html_style} ' class='#{html_class}'>"\
                "</header>"
        html.html_safe
    end
	  
	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

end






