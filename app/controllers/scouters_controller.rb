class ScoutersController < ApplicationController
  before_action :set_scouter, only: [:show, :edit, :update, :destroy]
  
  # GET /scouters
  # GET /scouters.json
  def history
    @scouters = Scouter.all.order("created_at DESC").paginate(page: params[:page])
  end

  # GET /scouters/1
  # GET /scouters/1.json
  def show
  end

  # GET /scouters/new
  def new
    @scouter = Scouter.new
  end

  # GET /scouters/1/edit
  def edit
  end

  # POST /scouters
  # POST /scouters.json
  def create
    @scouter = Scouter.new(scouter_params)
    respond_to do |format|
      if @scouter.save
        format.html { redirect_to @scouter }
        format.json { render :show, status: :created, location: @scouter }
      else
        format.html { render :new }
        format.json { render json: @scouter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scouters/1
  # PATCH/PUT /scouters/1.json
  def update
    respond_to do |format|
      if @scouter.update(scouter_params)
        format.html { redirect_to @scouter, notice: 'Scouter was successfully updated.' }
        format.json { render :show, status: :ok, location: @scouter }
      else
        format.html { render :edit }
        format.json { render json: @scouter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scouters/1
  # DELETE /scouters/1.json
  def destroy
    @scouter.destroy
    respond_to do |format|
      format.html { redirect_to scouters_url, notice: 'Scouter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scouter
      @scouter = Scouter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scouter_params
      params.require(:scouter).permit(:team, :player1, :player2, :player3, :player4, :player5)
    end
end
