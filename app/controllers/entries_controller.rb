class EntriesController < ApplicationController
	# before_action :set_entry, only: [:show]


	def index
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params)
		if @entry.save
			redirect_to @entry
		else
			redirect_to 'new'
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])
		@entry.update(entry_params)
	end

	def destroy
		@entry = Entry.find(params[:id])
		if @entry.destroy
			redirect_to entries_path
		else
			redirect_to entry_path
		end
	end

	private

		# def set_entry
		# 	@entry = Entry.find(params[:id])
		# end

		def entry_params
			params.require(:entry).permit(:author, :photo_url, :date_taken)
		end
end