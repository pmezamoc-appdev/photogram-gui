class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({:created_at => :desc})
    render({:template => "photos_templates/index.html.erb"})
  end 

  def show
  the_photo = params.fetch("details")

  @matching_photo = Photo.where({:id => the_photo}).first

  @list_of_comments = Comment.where({:photo_id => the_photo}).all
  render({:template => "photos_templates/show.html.erb"})
  end

  def bai
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({:id => the_id}).first

    matching_photos.destroy
    #render({:template => "photos_templates/bai.html.erb"}) 
    redirect_to("/photos")
  end

  def add_photo
    image = params.fetch("input_image")
    caption = params.fetch("input_caption")
    owner = params.fetch("input_owner_id")

    new_photo = Photo.new
    new_photo.image = image
    new_photo.caption = caption
    new_photo.owner_id = owner
    
    new_photo.save
    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def update
  the_id = params.fetch("update")
  matching_photos = Photo.where({:id => the_id}).first

  input_image = params.fetch("input_image")
  input_action = params.fetch("input_caption")

  matching_photos.image = input_image
  matching_photos.caption = input_action

  matching_photos.save

  redirect_to("/photos/" + matching_photos.id.to_s)
  end 
end
