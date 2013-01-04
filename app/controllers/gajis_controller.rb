class GajisController < ApplicationController
  # GET /gajis
  # GET /gajis.json
  def index
    @gajis = Gaji.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gajis }
    end
  end

  # GET /gajis/1
  # GET /gajis/1.json
  def show
    @gaji = Gaji.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gaji }
    end
  end

  # GET /gajis/new
  # GET /gajis/new.json
  def new
    @gaji = Gaji.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gaji }
    end
  end

  # GET /gajis/1/edit
  def edit
    @gaji = Gaji.find(params[:id])
  end

  # POST /gajis
  # POST /gajis.json
  def create
    @gaji = Gaji.new(params[:gaji])

    respond_to do |format|
      if @gaji.save
        format.html { redirect_to @gaji, notice: 'Gaji was successfully created.' }
        format.json { render json: @gaji, status: :created, location: @gaji }
      else
        format.html { render action: "new" }
        format.json { render json: @gaji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gajis/1
  # PUT /gajis/1.json
  def update
    @gaji = Gaji.find(params[:id])

    respond_to do |format|
      if @gaji.update_attributes(params[:gaji])
        format.html { redirect_to @gaji, notice: 'Gaji was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gaji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gajis/1
  # DELETE /gajis/1.json
  def destroy
    @gaji = Gaji.find(params[:id])
    @gaji.destroy

    respond_to do |format|
      format.html { redirect_to gajis_url }
      format.json { head :no_content }
    end
  end
end
