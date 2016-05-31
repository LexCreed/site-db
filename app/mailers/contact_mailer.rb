class ContactMailer < ApplicationMailer

	default from: "DB <dplb.mx@gmail.com>"

	def contact_send(params) @parameters=params 
		mail(to:"dplb.mx@gmail.com",subject:@parameters[:subject]) 
	end
end
