class LinksController < ApplicationController

	def index

	end

	def view
		@links = Link.all
		render :view
	end

	def create
		long_link = params[:link][:full_url]
		if long_link.split("//").first == "http:"
			link_array = long_link.split("//")
			link_array.shift
			domain = link_array.join
		else
			domain = long_link
		end

		new_link = Link.new
		new_link.full_url = ["http://",domain].join
		new_link.ritly_url = SecureRandom.urlsafe_base64(8)
		new_link.visits = 0
		new_link.save

		redirect_to "/go/#{new_link.ritly_url}/preview"
	end

	def show
		ritl = params[:ritlyurl]
		@link = Link.where(ritly_url: ritl).first

		render :show
	end

	def redirect
		ritl = params[:ritlyurl]
		link = Link.where(ritly_url: ritl).first
		link.visits += 1
		link.save

		redirect_to "#{link.full_url}"

	end

	def destroy
		id = params[:id]
		Link.destroy(id)
		redirect_to "/view"
	end



end
