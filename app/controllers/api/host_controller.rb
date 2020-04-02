
module Api
    class HostController < ApplicationController  
      def index
        @ip_address = IpAddress.all.includes(:host)

        page = 1 
        if params[:page].present?
          page = params[:page].to_i
        end

        per_page = 2

        render json: @ip_address.order(created_at: :desc).offset((page -1 ) * per_page).limit(per_page)
      end
    
      def create
        if !params[:dns_records][:hostnames].present?
          return render json: { error: "Should have at least one hostname" }, status: 400
        end

        if !params[:dns_records][:ip].present?
          return render json: { error: "IP is required" }, status: 400
        end

        @ip = IpAddress.create(ip: params[:dns_records][:ip])
        hostnames = params[:dns_records][:hostnames].map {|h| { hostname: h, ip_addresses_id: @ip }}
        @host = Host.create(hostnames)

        if @ip
          render json: @ip.id
        else
          render json: @ip.errors
        end
      end 

		end
end