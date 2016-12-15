class Mc::DownloadersController < Mc::BaseController

  def index
    @downloaders = Downloader.all.reverse
  end

end
