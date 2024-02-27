class EntriesController < ApplicationController
  before_action :set_place, only: [:index, :new, :create]

  def index
    @entries = @place.entries
  end
  
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.place = @place

    if @entry.save
      redirect_to place_entries_path(@place), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def entry_params
    params.require("entry").permit(:title, :description, :posted_on) # Update with the entry text
  end
end
