class CommentsController < ApplicationController

  before_action :find_comment, only: [:show, :edit, :update, :delete]

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
    @event = @comment.event
    if @comment.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
     redirect_to comment_path(@comment)
   else
     render :edit
   end
  end

  def show
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @event = @comment.event
    if @comment.user == current_user
      @comment.destroy
      redirect_to event_path(@event), notice: 'Deleted'
    else
      redirect_to comment_path, notice: 'You are not authorized to delete this comment.'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content,:event_id)
  end

  def find_comment
   @comment = Comment.find_by(id: params[:id])
   if !@comment
     flash[:message] = "Comment was not found."
     redirect_to comments_path
   end
  end

end
