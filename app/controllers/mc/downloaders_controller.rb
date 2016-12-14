class Mc::DownloadersController < Mc::BaseController

  def index
    @downloaders = Downloader.all.reverse
  end

  def create
    @downloader = Downloader.new(downloader_params)
    if @downloader.save
      file = open("public/downloads/sponsors/NUS CompClub Sponsor Kit 2017.pdf")
      send_file(file, :filename => "NUS CompClub Sponsor Kit 2017.pdf",
        :type => "application/pdf")
    end
  end

  private
  def downloader_params
    params.require(:downloader).permit(:name, :phone, :email, :organisation)
  end

end
