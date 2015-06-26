class AssignmentsController < ApplicationController
  before_action :teacher_logged_in?
  before_action :set_assignment, only: [:show, :edit, :update, :destroy, :update_grades]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new(teacher_id: session[:user_id])
  end

  # GET /assignments/1/edit
  def edit
    @teacher = Teacher.find_by_id(session[:user_id])
    @grades = Grade.where(assignment_id: @assignment.id)
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        @assignment.assign
        format.html { redirect_to assignments_path, notice: 'Assignment was successfully created.' }
        format.json { render :edit, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @assignment.update(assignment_params)
      render 'assignments/update'
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:teacher_id, :name, :due, grades_attributes: [:id, :score, :student_id])
    end
end
