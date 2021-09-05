module Api
  module V1
    class StudentsController < ApplicationController
      before_action :set_student, except: [:index]
      skip_before_action :authenticate_user!
      
      def index
        students = Students.all

        render json: StudentsSerializer.new(students).serializable_hash.to_json
      end

      def show
        render json: StudentSerializer.new(@student).serializable_hash.to_json
      end

      def create
        @student = Student.new(student_params)

        if @student.save
          render json: StudentsSerializer.new(@student).serializable_hash.to_json
        else
          render json: { error: @student.errors.messages }, status: 422
        end
      end

      def destroy
        if @student.destroy
          head :no_content
        else
          render json: { error: @student.errors.messages }, stauts: 442
        end
      end

      private

      def student_params
        params.require(:student).permit(:english_name, :chinese_name, :number, :participation_score, :class_group_id)
      end

      def set_student
        @student = Student.find(params[:id])
      end
    end
  end
end