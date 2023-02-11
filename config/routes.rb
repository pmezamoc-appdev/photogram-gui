Rails.application.routes.draw do

    get("/users", {:controller => "users", :action => "index"})
    get("/users/:user",{:controller => "users",:action => "users"})

    get("/photos",{:controller => "photos", :action => "index"})
    get("/photos/:details",{:controller => "photos", :action => "show"})

    get("/delete_photo/:toast_id", {:controller => "photos", :action => "bai"})

end
