module Api
  module V1
    class ClassGroupsController < ApplicationController
      before_action :set_class_group, except: [:index, :create]
      
      def index
        class_groups = ClassGroup.all

        render json: ClassGroupSerializer.new(class_groups, options).serializable_hash.to_json
      end

      def show
        render json: ClassGroupSerializer.new(@class_group, options).serializable_hash.to_json
      end

      def create
        @class_group.new(class_group_params)

        if @class_group.save
          render json: ClassGroupSerializer.new(@class_group).serializable_hash.to_json
        else
          render json: { error: @class_group.errors.messages }, status: 422
        end
      end

      def update
        if @class_group.update(class_group_params)
          render json: ClassGroupSerializer.new(@class_group, options).serializable_hash.to_json
        else
          render json: { error: @class_group.errors.messages }, status: 422
        end
      end

      def destroy
        if @class_group.destroy
          head :no_content
        else
          render json: { error: @class_group.errors.messages }, status: 422
        end
      end
      
      private

      def set_class_group
        @class_group = ClassGroup.find(slug: params[:slug])
      end

      def class_group_params
        params.require(:class_group).permit(:name, :user_id)
      end

      def options
        @options ||= { inlude: %w[seating_charts, students]}
      end
    end
  end
end