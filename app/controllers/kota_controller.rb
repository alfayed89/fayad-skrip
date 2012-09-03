class KotaController < ApplicationController
  # GET /kota
  # GET /kota.json
  def index
    @kota = Kotum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kota }
    end
  end

  # GET /kota/1
  # GET /kota/1.json
  def show
    @kotum = Kotum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kotum }
    end
  end

  # GET /kota/new
  # GET /kota/new.json
  def new
    @kotum = Kotum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kotum }
    end
  end

  # GET /kota/1/edit
  def edit
    @kotum = Kotum.find(params[:id])
  end

  # POST /kota
  # POST /kota.json
  def create
    @kotum = Kotum.new(params[:kotum])

    respond_to do |format|
      if @kotum.save
        format.html { redirect_to @kotum, notice: 'Kotum was successfully created.' }
        format.json { render json: @kotum, status: :created, location: @kotum }
      else
        format.html { render action: "new" }
        format.json { render json: @kotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kota/1
  # PUT /kota/1.json
  def update
    @kotum = Kotum.find(params[:id])

    respond_to do |format|
      if @kotum.update_attributes(params[:kotum])
        format.html { redirect_to @kotum, notice: 'Kotum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kota/1
  # DELETE /kota/1.json
  def destroy
    @kotum = Kotum.find(params[:id])
    @kotum.destroy

    respond_to do |format|
      format.html { redirect_to kota_url }
      format.json { head :no_content }
    end
  end
end
