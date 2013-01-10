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
  def index
  end
  
  def absen
    a = Absen.new(:status => 'MASUK', :absen_for => Time.now.to_date)
    a.karyawan = current_karyawan
    if a.save
      flash[:success] = "Absen Berhasil"
    else
      flash[:error] =  a.errors.to_a.join("<br/>")
    end
    redirect_to url_for(:action => :index)
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
