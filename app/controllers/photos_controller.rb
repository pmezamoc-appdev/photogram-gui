class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({:created_at => :asc})
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

end
