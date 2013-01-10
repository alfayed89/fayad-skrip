class HolydaysController < InternalController
  # GET /holydays
  # GET /holydays.json
  def index
    @holydays = Holyday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holydays }
    end
  end

  # GET /holydays/1
  # GET /holydays/1.json
  def show
    @holyday = Holyday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @holyday }
    end
  end

  # GET /holydays/new
  # GET /holydays/new.json
  def new
    @holyday = Holyday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @holyday }
    end
  end

  # GET /holydays/1/edit
  def edit
    @holyday = Holyday.find(params[:id])
  end

  # POST /holydays
  # POST /holydays.json
  def create
    @holyday = Holyday.new(params[:holyday])

    respond_to do |format|
      if @holyday.save
        format.html { redirect_to @holyday, notice: 'Holyday was successfully created.' }
        format.json { render json: @holyday, status: :created, location: @holyday }
      else
        format.html { render action: "new" }
        format.json { render json: @holyday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /holydays/1
  # PUT /holydays/1.json
  def update
    @holyday = Holyday.find(params[:id])

    respond_to do |format|
      if @holyday.update_attributes(params[:holyday])
        format.html { redirect_to @holyday, notice: 'Holyday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @holyday.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    @holyday = Holyday.find(params[:id])
    @holyday.approved = params[:disapprove].nil? 
    @holyday.approved_at = params[:disapprove].nil? ? Time.now.to_date : nil
    if @holyday.save
      flash[:success] = params[:disapprove].nil? ? "Pengajuan Cuti Berhasil Di Setujui" : "Pengajuan Cuti Ditolak"
    else
      flash[:error] = @holyday.errors.to_a.join(", ")
    end
    redirect_to :action => :index
  end
  # DELETE /holydays/1
  # DELETE /holydays/1.json
  def destroy
    @holyday = Holyday.find(params[:id])
    @holyday.destroy

    respond_to do |format|
      format.html { redirect_to holydays_url }
      format.json { head :no_content }
    end
  end
end
