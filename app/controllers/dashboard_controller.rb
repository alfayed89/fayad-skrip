class DashboardController < InternalController
  skip_load_resource
  skip_authorize_resource
  before_filter(:only => [:vacation, :create_vacation]) do
    @holydays = current_karyawan.holydays
  end
  before_filter(:only => [:pendidikan, :create_pendidikan]) do
    @pendidikans = current_karyawan.pendidikans
  end
  before_filter(:only => [:pengalaman, :create_pengalaman]) do
    @pengalamen = current_karyawan.pengalamen
  end
  before_filter(:only => [:edit, :update]) do
      @karyawan = current_karyawan
  end
  def upload_photo
    uploaded_io = params[:photo]
    begin
      file_name = "#{rand(999..9999999)}_pic.jpeg"
      File.open(Rails.root.join('public', 'uploads', file_name ), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      t = Twitter.update_with_media('#cuma-test #skripsi #please-jgn-reply '+Time.now.to_s, File.new('./public/uploads/'+file_name))
      current_karyawan.update_attribute('photo_url', t.attrs[:entities][:media][0][:media_url])
      flash[:success] = "Photo Berhasil diperbaharui"
    rescue Exception => e
      flash[:error] = e.message
    end

    redirect_to :action => :edit
  end
  def index
  end
  
  def edit
  end
  
  def update
    if @karyawan.update_attributes(params[:karyawan])
      flash[:success] = "Data Pribadi Berhasil diperbaharui"
      redirect_to :action => :index
    else
      flash[:error] = "Maaf, Ada yang salah dengan form yang anda isi"
      render :action => :edit
    end
  end
  
  def absen
    if params[:workoff].nil?
      a = Absen.new(:status => params[:status], :absen_for => Time.now.to_date)
      a.karyawan = current_karyawan
      if a.save
        flash[:success] = "Absen Berhasil"
      else
        flash[:error] =  a.errors.to_a.join("<br/>")
      end
      redirect_to url_for(:action => :index)
    else
      a = current_karyawan.absen_for_today
      if a.nil?
        flash[:error] = 'anda belum absen untuk hari ini'
      elsif a.status != "MASUK"
        flash[:error] = "anda <b>#{a.status.downcase}</b> untuk hari ini"
      elsif a.offduty.nil? == false
        flash[:alert] = "anda sudah menghari waktu kerja pada pukul #{a.offduty.strftime('%I:%M %p')}"
      else
        flash[:success] = "anda telah mengakhiri waktu kerja pada hari ini, selamat pulang, hati-hati dijalan. :)"
        a.work_off
      end
      redirect_to url_for(:action => :index)
    end
  end
  def absens
    @absens = current_karyawan.absens.page(params[:page])
  end
  def vacation
    @holyday = Holyday.new
  end
  
  def create_vacation
    @holyday = Holyday.new(params[:holyday])
    @holyday.karyawan = current_karyawan
    if @holyday.save
      flash[:success] = "Cuti Berhasil diajukan, silakan menunggu untuk di setujui oleh HRD"
      redirect_to :action => :vacation
    else
      render :action => :vacation
    end
  end
  
  def pendidikan
    @pendidikan = Pendidikan.new()    
  end
  def create_pendidikan
    @pendidikan = Pendidikan.new(params[:pendidikan])
    @pendidikan.karyawan = current_karyawan
    if @pendidikan.save
      flash[:success] = 'Berhasil menambah riwayat pendidikan'
      redirect_to :action => :pendidikan 
    else
      render :action => :pendidikan
    end
  end
  
  
  def pengalaman 
    @pengalaman = Pengalaman.new() 
  end
  
  def create_pengalaman
    @pengalaman = Pengalaman.new(params[:pengalaman].merge(:karyawan_id => current_karyawan.id))
    if @pengalaman.save
      flash[:success] = 'Berhasil menambah riwayat pendidikan'
      redirect_to :action => :pengalaman
    else
      render :action => :pengalaman
    end
  end
  
  
  def salary
    @gajis = current_karyawan.gajis
  end
end
