Rails.application.routes.draw do

    
    get("/", {:controller => "users", :action => "index"})
    get("/users", {:controller => "users", :action => "index"})
    get("/users/:user",{:controller => "users",:action => "users"})

    get("/photos",{:controller => "photos", :action => "index"})
    get("/photos/:details",{:controller => "photos", :action => "show"})

    get("/delete_photo/:toast_id", {:controller => "photos", :action => "bai"})
    get("/insert_photo_record", {:controller => "photos", :action => "add_photo"})
    get("/insert_comment_record", {:controller => "comments", :action => "create"})
    get("/insert_user_record", {:controller => "users", :action => "create"})
    get("/update_photo/:update", {:controller => "photos", :action => "update"})
end
