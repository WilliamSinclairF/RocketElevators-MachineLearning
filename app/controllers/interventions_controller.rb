class InterventionsController < ApplicationController
  include InterventionsHelper

  before_action :authenticate_user!

  def interventions; end

  def index
    @interventions = Intervention.all
  end

  def buildings
    buildings = Building.where(customer_id: params[:id])
    respond_to do |r|
      r.json { render json: buildings, include: { address: {} } }
    end
  end

  def batteries
    batteries = Battery.where(building_id: params[:id])
    respond_to { |r| r.json { render json: batteries } }
  end

  def columns
    columns = Column.where(battery_id: params[:id])
    respond_to { |r| r.json { render json: columns } }
  end

  def elevators
    elevators = Elevator.where(column_id: params[:id])
    respond_to { |r| r.json { render json: elevators } }
  end

  def new
    @intervention = Intervention.new
  end

  def create
    @intervention = Intervention.new(intervention_params)
    @intervention.author_id = current_user.id
    @intervention.save

    respond_to do |format|
      if @intervention.save
        intervention_zd_ticket(@intervention)
        format.html do
          redirect_to interventions_path,
                      notice: 'Intervention created successfully!'
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def intervention_params
    params.require(:intervention).permit(
      :author_id,
      :customer_id,
      :building_id,
      :battery_id,
      :column_id,
      :elevator_id,
      :employee_id,
      :report,
      :result,
      :status
    )
  end
end
