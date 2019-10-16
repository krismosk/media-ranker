class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]
  
  def index
    @works = Work.all
  end

  def show
    # @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end

  def new
    @work = Work.new
  end

  def edit
    # @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end

  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    # @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
    
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    # @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
    
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
    end
  end

  private

  def find_work
    @work = Work.find_by(id: params[:id])
  end 
  
  def work_params
    params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end 
end
