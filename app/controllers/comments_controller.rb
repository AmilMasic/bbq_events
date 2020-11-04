class CommentsController < ApplicationController


  def index
   if params[:event_id] && @event = Event.find_by_id(params[:event_id])
      @comments = @event.comments
   else
     @error = "That event doesn't exist" if params[:event_id]
     @comments = Comment.all
   end
 end

 def new
    if params[:event_id] && @event = Event.find_by_id(params[:event_id])
      @comment = @event.comments.build
    else
      @error = "That event doesn't exist" if params[:event_id]
      @comment = Comment.new
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:event_id)
  end

end