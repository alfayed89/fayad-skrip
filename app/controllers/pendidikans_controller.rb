class PendidikansController < ApplicationController
  # GET /pendidikans
  # GET /pendidikans.json
  def index
    @pendidikans = Pendidikan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pendidikans }
    end
  end

  # GET /pendidikans/1
  # GET /pendidikans/1.json
  def show
    @pendidikan = Pendidikan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pendidikan }
    end
  end

  # GET /pendidikans/new
  # GET /pendidikans/new.json
  def new
    @pendidikan = Pendidikan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pendidikan }
    end
  end

  # GET /pendidikans/1/edit
  def edit
    @pendidikan = Pendidikan.find(params[:id])
  end

  # POST /pendidikans
  # POST /pendidikans.json
  def create
    @pendidikan = Pendidikan.new(params[:pendidikan])

    respond_to do |format|
      if @pendidikan.save
        format.html { redirect_to @pendidikan, notice: 'Pendidikan was successfully created.' }
        format.json { render json: @pendidikan, status: :created, location: @pendidikan }
      else
        format.html { render action: "new" }
        format.json { render json: @pendidikan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pendidikans/1
  # PUT /pendidikans/1.json
  def update
    @pendidikan = Pendidikan.find(params[:id])

    respond_to do |format|
      if @pendidikan.update_attributes(params[:pendidikan])
        format.html { redirect_to @pendidikan, notice: 'Pendidikan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pendidikan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pendidikans/1
  # DELETE /pendidikans/1.json
  def destroy
    @pendidikan = Pendidikan.find(params[:id])
    @pendidikan.destroy

    respond_to do |format|
      format.html { redirect_to pendidikans_url }
      format.json { head :no_content }
    end
  end
end
