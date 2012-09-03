class ProvinsisController < ApplicationController
  # GET /provinsis
  # GET /provinsis.json
  def index
    @provinsis = Provinsi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @provinsis }
    end
  end

  # GET /provinsis/1
  # GET /provinsis/1.json
  def show
    @provinsi = Provinsi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @provinsi }
    end
  end

  # GET /provinsis/new
  # GET /provinsis/new.json
  def new
    @provinsi = Provinsi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @provinsi }
    end
  end

  # GET /provinsis/1/edit
  def edit
    @provinsi = Provinsi.find(params[:id])
  end

  # POST /provinsis
  # POST /provinsis.json
  def create
    @provinsi = Provinsi.new(params[:provinsi])

    respond_to do |format|
      if @provinsi.save
        format.html { redirect_to @provinsi, notice: 'Provinsi was successfully created.' }
        format.json { render json: @provinsi, status: :created, location: @provinsi }
      else
        format.html { render action: "new" }
        format.json { render json: @provinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /provinsis/1
  # PUT /provinsis/1.json
  def update
    @provinsi = Provinsi.find(params[:id])

    respond_to do |format|
      if @provinsi.update_attributes(params[:provinsi])
        format.html { redirect_to @provinsi, notice: 'Provinsi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @provinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provinsis/1
  # DELETE /provinsis/1.json
  def destroy
    @provinsi = Provinsi.find(params[:id])
    @provinsi.destroy

    respond_to do |format|
      format.html { redirect_to provinsis_url }
      format.json { head :no_content }
    end
  end
end
