class PengalamenController < InternalController
  # GET /pengalamen
  # GET /pengalamen.json
  def index
    @pengalamen = Pengalaman.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pengalamen }
    end
  end

  # GET /pengalamen/1
  # GET /pengalamen/1.json
  def show
    @pengalaman = Pengalaman.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pengalaman }
    end
  end

  # GET /pengalamen/new
  # GET /pengalamen/new.json
  def new
    @pengalaman = Pengalaman.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pengalaman }
    end
  end

  # GET /pengalamen/1/edit
  def edit
    @pengalaman = Pengalaman.find(params[:id])
  end

  # POST /pengalamen
  # POST /pengalamen.json
  def create
    @pengalaman = Pengalaman.new(params[:pengalaman])

    respond_to do |format|
      if @pengalaman.save
        format.html { redirect_to @pengalaman, notice: 'Pengalaman was successfully created.' }
        format.json { render json: @pengalaman, status: :created, location: @pengalaman }
      else
        format.html { render action: "new" }
        format.json { render json: @pengalaman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pengalamen/1
  # PUT /pengalamen/1.json
  def update
    @pengalaman = Pengalaman.find(params[:id])

    respond_to do |format|
      if @pengalaman.update_attributes(params[:pengalaman])
        format.html { redirect_to @pengalaman, notice: 'Pengalaman was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pengalaman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pengalamen/1
  # DELETE /pengalamen/1.json
  def destroy
    @pengalaman = Pengalaman.find(params[:id])
    @pengalaman.destroy

    respond_to do |format|
      format.html { redirect_to pengalamen_url }
      format.json { head :no_content }
    end
  end
end
