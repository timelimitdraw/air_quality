class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@submissions.where.not(:csv_attachment_latitude => nil)) do |submission, marker|
      marker.lat submission.csv_attachment_latitude
      marker.lng submission.csv_attachment_longitude
      marker.infowindow "<h5><a href='/submissions/#{submission.id}'>#{submission.created_at}</a></h5><small>#{submission.csv_attachment_formatted_address}</small>"
    end

    render("submissions/index.html.erb")
  end

  def show
    @submission = Submission.find(params[:id])

    render("submissions/show.html.erb")
  end

  def new
    @submission = Submission.new

    render("submissions/new.html.erb")
  end

  def create
    @submission = Submission.new

    @submission.csv_attachment = params[:csv_attachment]
    @submission.user_id = params[:user_id]

    save_status = @submission.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/submissions/new", "/create_submission"
        redirect_to("/submissions")
      else
        redirect_back(:fallback_location => "/", :notice => "Submission created successfully.")
      end
    else
      render("submissions/new.html.erb")
    end
  end

  def edit
    @submission = Submission.find(params[:id])

    render("submissions/edit.html.erb")
  end

  def update
    @submission = Submission.find(params[:id])

    @submission.csv_attachment = params[:csv_attachment]
    @submission.user_id = params[:user_id]

    save_status = @submission.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/submissions/#{@submission.id}/edit", "/update_submission"
        redirect_to("/submissions/#{@submission.id}", :notice => "Submission updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Submission updated successfully.")
      end
    else
      render("submissions/edit.html.erb")
    end
  end

  def destroy
    @submission = Submission.find(params[:id])

    @submission.destroy

    if URI(request.referer).path == "/submissions/#{@submission.id}"
      redirect_to("/", :notice => "Submission deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Submission deleted.")
    end
  end
end
