class SelectionsController < ApplicationController
  skip_before_filter :require_user, :only => [:index, :show]
  
  # GET /selections
  # GET /selections.json
  def index
    @selections = Selection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selections }
    end
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
    @selection = Selection.find(params[:id])
    if @selection.nil?
      @user_name = params[:user_name]
      @selection_name = params[:selection_name]
      @selection = Selection.first(:public_url => "#{@user_name}/#{@selection_name}")
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection }
    end
  end

  # GET /selections/new
  # GET /selections/new.json
  def new
    @selection = Selection.new

    respond_to do |format|      
      format.html # new.html.erb
      format.json { render json: @selection }
    end
  end

  # GET /selections/1/edit
  def edit
    @selection = Selection.find(params[:id])
    
    if session[:user_id] != @selection.user_id
      redirect_to @selection, :notice => 'You cannot edit a selection that does not belong to you.'
    end
  end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(params[:selection])
    @selection.user_id = session[:user_id]
    
    respond_to do |format|
      if @selection.save

        @bottles_to_add = params["bottles"];
        if (@bottles_to_add)
          @bottles_to_add.each do |bottle_id|
            @selection.add_bottle(Bottle.find(bottle_id))
          end
        end

        format.html { redirect_to @selection, notice: 'Selection was successfully created.' }
        format.json { render json: @selection, status: :created, location: @selection }
      else
        format.html { render action: "new" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selections/1
  # PUT /selections/1.json
  def update
    @selection = Selection.find(params[:id])
    
    @bottles_to_add = params["bottles"];
    
    @selection.bottle_ids.clear
    if @bottles_to_add
      @bottles_to_add.each do |bottle_id|
        @selection.add_bottle(Bottle.find(bottle_id))
      end
    end
    
    @selection.user_id = session[:user_id]

    respond_to do |format|
      if @selection.update_attributes(params[:selection])
        format.html { redirect_to @selection, notice: 'Selection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection = Selection.find(params[:id])
    @user = User.find(@selection.user_id);
    
    @selection.destroy

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end
  
  def add_bottle
    @selection = Selection.find(params[:selection])
    @bottle = Bottle.find(params[:bottle])
    
    @selection.add_bottle(@bottle)
    @selection.save!
    redirect_to @bottle
  end
  
  def remove_bottle
    @selection = Selection.find(params[:selection])
    @bottle = Bottle.find(params[:bottle])
    
    @selection.remove_bottle(@bottle)
    @selection.save!
    redirect_to @bottle
  end
  
end
