class StudentsController < ApplicationController
  before_action :find_student_by_id, only: [:show, :update, :destroy]

  def index
    @students = Student.all 

    render json: @students 
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student 
    else
      render status: 422
    end
  end

  def show 
    render json: @student 
  end

  def update 
    @student.update(student_params)

    render json: @student 
  end

  def destroy 
    @student.destroy 

    redirect_to action: "index" 
  end

  private

  def student_params
    params.require('student').permit([:name, :age, :program, :current_student])
  end

  def find_student_by_id
    @student = Student.find(params[:id])
  end

end
