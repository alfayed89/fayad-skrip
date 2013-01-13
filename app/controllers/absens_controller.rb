class AbsensController < InternalController
  # GET /absens
  # GET /absens.json
  def index
    @absens = Absen.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @absens }
    end
  end

  # GET /absens/1
  # GET /absens/1.json
  def show
    @absen = Absen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @absen }
    end
  end

  # GET /absens/new
  # GET /absens/new.json
  def new
    @absen = Absen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @absen }
    end
  end

  # GET /absens/1/edit
  def edit
    @absen = Absen.find(params[:id])
  end

  # POST /absens
  # POST /absens.json
  def create
    @absen = Absen.new(params[:absen])

    respond_to do |format|
      if @absen.save
        format.html { redirect_to @absen, notice: 'Absen was successfully created.' }
        format.json { render json: @absen, status: :created, location: @absen }
      else
        format.html { render action: "new" }
        format.json { render json: @absen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /absens/1
  # PUT /absens/1.json
  def update
    @absen = Absen.find(params[:id])

    respond_to do |format|
      if @absen.update_attributes(params[:absen])
        format.html { redirect_to @absen, notice: 'Absen was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @absen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absens/1
  # DELETE /absens/1.json
  def destroy
    @absen = Absen.find(params[:id])
    @absen.destroy

    respond_to do |format|
      format.html { redirect_to absens_url }
      format.json { head :no_content }
    end
  end
end
