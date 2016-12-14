class PagesController < ApplicationController
  def index
    home()
  end

  def home
    @featured_events = Event.where(featured: true).limit(3)
  end

  def mcmem
    render 'about'
  end

	def about
		@mc_batch = McBatch.where(published: true).order(created_at: :desc).first
		@members = @mc_batch.mc_members.order('wingid', 'wingrank', 'cellrank') if @mc_batch
		@wings = McWing.order('wingid')
	end

  def event
    @events = Event.order(created_at: :desc)
    render 'events'
  end

  def students
  end

  def events
    @events = Event.order(created_at: :desc)
  end

  def sponsors
    @sponsors = Sponsor.all.where(featured: true)
    @downloader = Downloader.new
  end

  def connect
  end

  def enquiry
    @enquiry = Enquiry.new(enquiry_params)
    time_now = DateTime.now

    respond_to do |format|
      if verify_recaptcha(model: @enquiry)
        logger.fatal('capctha pass')
        # send mail before saving to database.
        # because I think it's more likely that the mailing fails than it can't save to db
        # also to prevent multiple entries in db.
        if EnquiryMailer.notify(@enquiry, time_now).deliver_now
          @enquiry.save
        end
        format.html { redirect_to connect_path, notice: 'Enquiry Submitted!' }

      else
        logger.fatal('capctha fail')
      end
    end
  end

  private
  def enquiry_params
    params.require(:enquiry).permit(:name, :email, :contact, :message)
  end

end
