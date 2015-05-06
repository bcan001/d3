class StaticsController < ApplicationController

	#respond_to :json


	def index
		
	end

	def show_page
		render json: Static.all
	end

	def svgchartpage

	end

	def map

	end

	def mapdata
		#where the map data will render json
	
	end



end