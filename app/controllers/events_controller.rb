class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]
  # GET /events or /events.json
  def index
    @events = Event.all.order('created_at DESC')
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  # GET /events/1 or /events/1.json
  def show
    @invitation = Invitation.new
  end

  # GET /events/new
  def new
    @event = current_user.created_events.build
  end

  # GET /events/1/edit
  def edit; end

  # event /events or /events.json
  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def correct_user
    @event = current_user.created_events.find_by(id: params[:id])
    redirect_to events_path, alert: "You're not authorized to edit this event" if @event.nil?
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:creator_id, :title, :description, :location, :start_date_time, :end_date_time,
                                  :created_at)
  end
end
