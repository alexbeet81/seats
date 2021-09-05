module Api
  module V1
    class SeatingChartsController < ApplicationController
      before_action :set_seating_chart, except: [:index, :create]
      skip_before_action :authenticate_user!
      
      def index
        seating_charts = SeatingCharts.all

        render json: SeatingChartsSerializer.new(seating_charts).serializable_hash.to_json
      end

      def show
        render json: SeatingChartsSerializer.new(@seatching_chart).serializable_hash.to_json
      end

      def create
        @seating_chart.new(seating_chart_params)

        if @seating_chart.save
          render json: SeatingChartsSerializer.new(@seating_chart).serializable_hash.to_json
        else
          render json: { error: @seating_chart.errors.messages }, status: 422
        end
      end

      def update
        if @seating_chart.update
          render json: SeatingChartsSerializer.new(@seating_chart).serializable_hash.to_json
        else
          render json: { error: @seating_chart.errors.messages }, status: 422
        end
      end

      def destroy
        if @seating_chart.destroy
          head :no_content
        else
          render json: { error: @seating_chart.errors.messages }, status: 422
        end
      end

      private

      def seating_chart_params
        params.require(:seating_chart).permit(:number_of_students, :rows, :columns, :class_group_id)
      end

      def set_seating_chart
        @seating_chart = SeatingChart.find(params[:id])
      end
    end
  end
end