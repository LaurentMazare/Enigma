class EnigmasController < ApplicationController
  # GET /enigmas
  # GET /enigmas.json
  def index
    @tag     = params[:tag_id]
    @enigmas = Enigma.all
    if @tag != nil
      @enigmas = @enigmas.find_all{ |item| item.tags.index{|t| t.name == @tag} != nil }
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enigmas }
    end
  end

  # GET /enigmas/1
  # GET /enigmas/1.json
  def show
    @enigma = Enigma.find(params[:id])
    @tags   = @enigma.tags

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enigma }
    end
  end

  # GET /enigmas/new
  # GET /enigmas/new.json
  def new
    @enigma = Enigma.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enigma }
    end
  end

  # GET /enigmas/1/edit
  def edit
    @enigma = Enigma.find(params[:id])
    @tag_ids = @enigma.tags.map{ |tag| tag.id }
  end

  # POST /enigmas
  # POST /enigmas.json
  def create
    @enigma = Enigma.new(params[:enigma])

    respond_to do |format|
      if @enigma.save
        format.html { redirect_to @enigma, notice: 'Enigma was successfully created.' }
        format.json { render json: @enigma, status: :created, location: @enigma }
      else
        format.html { render action: "new" }
        format.json { render json: @enigma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enigmas/1
  # PUT /enigmas/1.json
  def update
    @enigma = Enigma.find(params[:id])
    tag_ids = params[:enigma][:tags].find_all{ |x| x != "" }
    params[:enigma][:tags] = tag_ids.map{ |tag_id| Tag.find(tag_id) }

    respond_to do |format|
      if @enigma.update_attributes(params[:enigma])
        format.html { redirect_to @enigma, notice: 'Enigma was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enigma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enigmas/1
  # DELETE /enigmas/1.json
  def destroy
    @enigma = Enigma.find(params[:id])
    @enigma.destroy

    respond_to do |format|
      format.html { redirect_to enigmas_url }
      format.json { head :no_content }
    end
  end
end
