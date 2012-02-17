class AnnouncementsController < ApplicationController
  def new
      @post = Announcements.new
      @study = Study.find(params[:study_id])
      respond_to do |format|
        format.html
      end
  end

  def create
    @post = Announcements.new(params[:announcements])
    @post.user_id = current_user.id
    @post.study_id = params[:study_id]
    respond_to do |format|
      if @post.save
        format.html { redirect_to "/studies/#{@post.study_id}/announcements/#{@post.id}", notice: 'Announcement was successfully created.' }
      end
    end
  end

  def show
      @post = Announcements.post_by_study_and_id(params[:study_id], params[:id]).first
  end

end
