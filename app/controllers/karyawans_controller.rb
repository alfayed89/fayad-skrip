class KaryawansController < InternalController
  # GET /karyawans
  # GET /karyawans.json
  def search_ajax
    @karyawans = Karyawan.where('id > ?', 0)
    @karyawans = @karyawans.where('nama_lengkap like :query or nik like :query', :query => "%#{params[:q].titleize}%") unless params[:q].nil?
    render json: @karyawans
  end
  def index
    # @karyawans = Karyawan.page(params[:page])

    @karyawans = @karyawans.where('nama_lengkap like :q or nik like :q', :q => "%#{params[:q]}%") unless params[:q].nil?
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @karyawans }
    end
  end

  # GET /karyawans/1
  # GET /karyawans/1.json
  def show
    @karyawan = Karyawan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @karyawan }
    end
  end

  # GET /karyawans/new
  # GET /karyawans/new.json
  def new
    @karyawan = Karyawan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @karyawan }
    end
  end

  # GET /karyawans/1/edit
  def edit
    @karyawan = Karyawan.find(params[:id])
  end

  # POST /karyawans
  # POST /karyawans.json
  def create
    @karyawan = Karyawan.g_new(params[:karyawan])

    respond_to do |format|
      if @karyawan.save
        format.html { redirect_to @karyawan, notice: 'Karyawan was successfully created.' }
        format.json { render json: @karyawan, status: :created, location: @karyawan }
      else
        format.html { render action: "new" }
        format.json { render json: @karyawan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /karyawans/1
  # PUT /karyawans/1.json
  def update
    @karyawan = Karyawan.find(params[:id])

    respond_to do |format|
      if @karyawan.update_attributes(params[:karyawan])
        format.html { redirect_to @karyawan, notice: 'Karyawan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @karyawan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /karyawans/1
  # DELETE /karyawans/1.json
  def destroy
    @karyawan = Karyawan.find(params[:id])
    @karyawan.destroy

    respond_to do |format|
      format.html { redirect_to karyawans_url }
      format.json { head :no_content }
    end
  end
end
