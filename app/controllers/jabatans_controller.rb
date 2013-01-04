class JabatansController < ApplicationController
  # GET /jabatans
  # GET /jabatans.json
  def index
    @jabatans = Jabatan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jabatans }
    end
  end

  # GET /jabatans/1
  # GET /jabatans/1.json
  def show
    @jabatan = Jabatan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jabatan }
    end
  end

  # GET /jabatans/new
  # GET /jabatans/new.json
  def new
    @jabatan = Jabatan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jabatan }
    end
  end

  # GET /jabatans/1/edit
  def edit
    @jabatan = Jabatan.find(params[:id])
  end

  # POST /jabatans
  # POST /jabatans.json
  def create
    @jabatan = Jabatan.new(params[:jabatan])

    respond_to do |format|
      if @jabatan.save
        format.html { redirect_to @jabatan, notice: 'Jabatan was successfully created.' }
        format.json { render json: @jabatan, status: :created, location: @jabatan }
      else
        format.html { render action: "new" }
        format.json { render json: @jabatan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jabatans/1
  # PUT /jabatans/1.json
  def update
    @jabatan = Jabatan.find(params[:id])

    respond_to do |format|
      if @jabatan.update_attributes(params[:jabatan])
        format.html { redirect_to @jabatan, notice: 'Jabatan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jabatan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jabatans/1
  # DELETE /jabatans/1.json
  def destroy
    @jabatan = Jabatan.find(params[:id])
    @jabatan.destroy

    respond_to do |format|
      format.html { redirect_to jabatans_url }
      format.json { head :no_content }
    end
  end
end
