class ZipsController < ApplicationController
  def index
    @zips = Zip.page(params[:page]).per(10)

    render("zips/index.html.erb")
  end

  def show
    @zip = Zip.find(params[:id])

    render("zips/show.html.erb")
  end

  def new
    @zip = Zip.new

    render("zips/new.html.erb")
  end

  def create
    @zip = Zip.new

    @zip.user_id = params[:user_id]
    @zip.zip_code = params[:zip_code]

    save_status = @zip.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/zips/new", "/create_zip"
        redirect_to("/zips")
      else
        redirect_back(:fallback_location => "/", :notice => "Zip created successfully.")
      end
    else
      render("zips/new.html.erb")
    end
  end

  def edit
    @zip = Zip.find(params[:id])

    render("zips/edit.html.erb")
  end

  def update
    @zip = Zip.find(params[:id])

    @zip.user_id = params[:user_id]
    @zip.zip_code = params[:zip_code]

    save_status = @zip.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/zips/#{@zip.id}/edit", "/update_zip"
        redirect_to("/zips/#{@zip.id}", :notice => "Zip updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Zip updated successfully.")
      end
    else
      render("zips/edit.html.erb")
    end
  end

  def destroy
    @zip = Zip.find(params[:id])

    @zip.destroy

    if URI(request.referer).path == "/zips/#{@zip.id}"
      redirect_to("/", :notice => "Zip deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Zip deleted.")
    end
  end
end
