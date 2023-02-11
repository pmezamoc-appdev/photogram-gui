class CommentsController < ApplicationController

def create
  body = params.fetch("input_body")
  photo = params.fetch("input_photo_id")
  author = params.fetch("input_author_id")

  new_comment = Comment.new
  new_comment.body = body
  new_comment.photo_id = photo
  new_comment.author_id = author

  new_comment.save
  redirect_to("/photos/" + new_comment.photo_id.to_s)
end 
  
end
