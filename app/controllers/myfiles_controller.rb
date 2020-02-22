# require 'Kconv'
class MyfilesController < ApplicationController
  before_action :set_myfile, only: [:show, :edit, :update, :destroy]

  # GET /myfiles
  # GET /myfiles.json
  def index
    @myfiles = Myfile.order("created_at DESC").page(params[:page]).per(10)
  end

  # GET /myfiles/1
  # GET /myfiles/1.json
  def show
  end

  # GET /myfiles/new
  def new
    @myfile = Myfile.new
  end

  # GET /myfiles/1/edit
  def edit
  end

  # POST /myfiles
  # POST /myfiles.json
  def create
    @myfile = Myfile.create(myfile_params)
    if myfile_params[:file]
      file = myfile_params[:file]
      file_name = file.original_filename
      @myfile.filename= file.original_filename
      result = uploadpdf(file,file_name)
    end

    respond_to do |format|
      if @myfile.save
        format.html { redirect_to @myfile, notice: 'Myfile was successfully created.' }
        format.json { render :show, status: :created, location: @myfile }
      else
        format.html { render :new }
        format.json { render json: @myfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myfiles/1
  # PATCH/PUT /myfiles/1.json
  def update
    respond_to do |format|
      if @myfile.update(myfile_params)
        format.html { redirect_to @myfile, notice: 'Myfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @myfile }
      else
        format.html { render :edit }
        format.json { render json: @myfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myfiles/1
  # DELETE /myfiles/1.json
  def destroy
    @myfile.destroy
    respond_to do |format|
      format.html { redirect_to myfiles_url, notice: 'Myfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def downloadpdf
    myfile=Myfile.find(params[:id])
    filepath = Rails.root.join('public',myfile.filename)
    stat = File::stat(filepath)
    send_file(filepath, :filename => myfile.filename, :length => stat.size)
  end

  def search
    @myfiles = Myfile.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(10)
    @search = params[:keyword]
    # binding.pry
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myfile
      @myfile = Myfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def myfile_params
      params.require(:myfile).permit(:title, :file, :comment, :address).merge(user_id: current_user.id)
    end

    def uploadpdf(file_object,file_name)
      ext = file_name[file_name.rindex('.') + 1, 4].downcase
      perms = ['.pdf']
      if !perms.include?(File.extname(file_name).downcase)
        result = 'アップロードできるのはpdfファイルのみです。'
      elsif file_object.size > 10.megabyte
        result = 'ファイルサイズは10MBまでです。'
      else
        File.open("public/#{file_name}", 'wb') { |f| f.write(file_object.read) }    #本番環境では.toutf8がエラーになるので削除。本来はfile_name.toutf8
        result = "success"
      end
      return result
    end

    def deleteipdf(file_name)
      File.unlink "public/"+file_name   #本番環境では.toutf8がエラーになるので削除。本来はfile_name.toutf8だった
    end
end
