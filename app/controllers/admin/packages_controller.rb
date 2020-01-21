class Admin::PackagesController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, :only => :create

    def index
        
    end

    def create
        file = params[:json_file]
        data = JSON.parse(file.read)

        report_generator = OverweightReportGenerator.new(data)
        report_generator.import_labels_data
        report_generator.calculate_overweight

        redirect_to report_admin_packages_path

    end

    def report
        @packages = Package.paginate(page: params[:page],:per_page => 5)
    end
end
