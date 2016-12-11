class Mc::McBatchesController < Mc::BaseController
  before_action :set_mc_batch, only: [:show, :edit, :update, :destroy]

  # GET /mc_batches
  # GET /mc_batches.json
  def index
    @mc_batches = McBatch.order(created_at: :desc)
  end

  # GET /mc_batches/1
  # GET /mc_batches/1.json
  def show
    @mc_members = @mc_batch.mc_members
  end

  # GET /mc_batches/new
  def new
    @mc_batch = McBatch.new
  end

  # GET /mc_batches/1/edit
  def edit
  end

  # POST /mc_batches
  # POST /mc_batches.json
  def create
    @mc_batch = McBatch.new(mc_batch_params)
    last_batch = McBatch.where(published: true).order(created_at: :desc).first

    respond_to do |format|
      if @mc_batch.save
        # copy last created and published mc_batch structure
        if last_batch
          mc_members = last_batch.mc_members
          for m in mc_members
            @mc_batch.mc_members.create(
              name: 'To Be Added',
              position: m.position,
              wingid: m.wingid,
              wingrank: m.wingrank,
              cellrank: m.cellrank,
              course: 'To Be Added',
              year: 1,
              description: 'To Be Added',
              casualimg: 'http://i.imgur.com/n2Kns6O.jpg')
          end
        end
        format.html { redirect_to @mc_batch, notice: 'MC batch was successfully created.' }
        format.json { render :show, status: :created,
          location: @mc_batch }
      else
        format.html { render :new }
        format.json { render json: @mc_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mc_batches/1
  # PATCH/PUT /mc_batches/1.json
  def update
    respond_to do |format|
      if @mc_batch.update(mc_batch_params)
        format.html { redirect_to @mc_batch, notice: 'MC batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @mc_batch }
      else
        format.html { render :edit }
        format.json { render json: @mc_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mc_batches/1
  # DELETE /mc_batches/1.json
  def destroy
    @mc_batch.destroy
    respond_to do |format|
      format.html { redirect_to mc_batches_url, notice: 'MC batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mc_batch
      @mc_batch = McBatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mc_batch_params
      params.require(:mc_batch).permit(:name, :published)
    end
end
