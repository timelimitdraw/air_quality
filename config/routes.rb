Rails.application.routes.draw do
  root :to => "zips#index"
  # Routes for the Submission resource:
  # CREATE
  get "/submissions/new", :controller => "submissions", :action => "new"
  post "/create_submission", :controller => "submissions", :action => "create"

  # READ
  get "/submissions", :controller => "submissions", :action => "index"
  get "/submissions/:id", :controller => "submissions", :action => "show"

  # UPDATE
  get "/submissions/:id/edit", :controller => "submissions", :action => "edit"
  post "/update_submission/:id", :controller => "submissions", :action => "update"

  # DELETE
  get "/delete_submission/:id", :controller => "submissions", :action => "destroy"
  #------------------------------

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
