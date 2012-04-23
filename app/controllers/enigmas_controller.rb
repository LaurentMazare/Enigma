class EnigmasController < ApplicationController
  before_filter :authenticate, :except => [:index]
  # GET /enigmas
  # GET /enigmas.json
  def index
    tag      = params[:tag_id]
    user     = params[:user_id]
    @enigmas = Enigma.all.sort
    @filter  = nil
    if tag != nil
      tag = tag.to_i
      @filter  = Tag.find(tag).name
      @enigmas = @enigmas.find_all{ |item| item.tags.index{|t| t.id == tag} != nil }
    end
    if user != nil
      user = user.to_i
      @filter = User.find(user).login
      @enigmas = @enigmas.find_all{ |item| item.user.id == user }
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
    tag_ids = params[:enigma][:tags].find_all{ |x| x != "" }
    params[:enigma][:tags] = tag_ids.map{ |tag_id| Tag.find(tag_id) }
    params[:enigma][:user] = current_user
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
    if @enigma.user.nil?
      params[:enigma][:user] = current_user
    end
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

  protected

  def authenticate
    if logged_in?
      return true
    else
      redirect_to root_url, :notice => "You must be logged in to add/edit/view enigmas!"
    end
  end

end
