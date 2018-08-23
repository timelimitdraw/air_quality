Rails.application.routes.draw do
  # Routes for the Zip resource:
  # CREATE
  get "/zips/new", :controller => "zips", :action => "new"
  post "/create_zip", :controller => "zips", :action => "create"

  # READ
  get "/zips", :controller => "zips", :action => "index"
  get "/zips/:id", :controller => "zips", :action => "show"

  # UPDATE
  get "/zips/:id/edit", :controller => "zips", :action => "edit"
  post "/update_zip/:id", :controller => "zips", :action => "update"

  # DELETE
  get "/delete_zip/:id", :controller => "zips", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
