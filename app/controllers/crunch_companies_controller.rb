class CrunchCompaniesController < ApplicationController
  # GET /crunch_companies
  # GET /crunch_companies.json

  


  

  def index
    @crunch_companies = CrunchCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @crunch_companies }
    end
  end

  # GET /crunch_companies/1
  # GET /crunch_companies/1.json
  def show
    @crunch_company = CrunchCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @crunch_company }
    end
  end

  # GET /crunch_companies/new
  # GET /crunch_companies/new.json
  def new

    @crunch_company = CrunchCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @crunch_company }
    end
  end

  # GET /crunch_companies/1/edit
  def edit
    @crunch_company = CrunchCompany.find(params[:id])
  end

  # POST /crunch_companies
  # POST /crunch_companies.json
  def create
    @crunch_company = CrunchCompany.new(params[:crunch_company])
    @fetch_crunch = Crunchbase::Company.get(@crunch_company.company_name)
    # @fetch_crunch_posts_call = Crunchbase::Posts.get(@crunch_company.company_name)
    # @fetch_crunch_posts = @fetch_crunch["num_posts"]
    @fetch_crunch_ipo_year = @fetch_crunch.ipo["pub_year"]
    @fetch_crunch_ipo_valuation = @fetch_crunch.ipo["valuation_amount"]
    @fetch_crunch_ipo_ticker = @fetch_crunch.ipo["stock_symbol"]

    respond_to do |format|
      if @crunch_company.save
        @crunch_company.update_attribute(:ipo_year, @fetch_crunch_ipo_year)
        @crunch_company.update_attribute(:ipo_valuation, @fetch_crunch_ipo_valuation)
        @crunch_company.update_attribute(:ipo_ticker, @fetch_crunch_ipo_ticker)
        @crunch_company.update_attribute(:posts, @fetch_crunch_posts)
        format.html { redirect_to @crunch_company, notice: 'Crunch company was successfully created.' }
        format.json { render json: @crunch_company, status: :created, location: @crunch_company }
      else
        format.html { render action: "new" }
        format.json { render json: @crunch_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crunch_companies/1
  # PUT /crunch_companies/1.json
  def update
    @crunch_company = CrunchCompany.find(params[:id])
    @fetch_crunch = Crunchbase::Company.get(@crunch_company.company_name)
    @fetch_crunch_posts = @fetch_crunch.ipo

    respond_to do |format|
      if @crunch_company.update_attributes(params[:crunch_company])
        @crunch_company.update_attribute(:posts, @fetch_crunch_posts)
        format.html { redirect_to @crunch_company, notice: 'Crunch company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @crunch_company.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /crunch_companies/1
  # DELETE /crunch_companies/1.json
  def destroy
    @crunch_company = CrunchCompany.find(params[:id])
    @crunch_company.destroy

    respond_to do |format|
      format.html { redirect_to crunch_companies_url }
      format.json { head :no_content }
    end
  end

  # custom crunch method to take from form

  def crunch
    @crunch_company = CrunchCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @crunch_company }
    end
    @fetch_crunch = Crunchbase::Company.get(@crunch_company.company_name)
    # @fetch_crunch_posts_call = Crunchbase::Posts.get(@crunch_company.company_name)
    # @fetch_crunch_posts = @fetch_crunch["num_posts"]
    @fetch_crunch_ipo_year = @fetch_crunch.ipo["pub_year"]
    @fetch_crunch_ipo_valuation = @fetch_crunch.ipo["valuation_amount"]
    @fetch_crunch_ipo_ticker = @fetch_crunch.ipo["stock_symbol"]

    respond_to do |format|
      if @crunch_company.save
        @crunch_company.update_attribute(:ipo_year, @fetch_crunch_ipo_year)
        @crunch_company.update_attribute(:ipo_valuation, @fetch_crunch_ipo_valuation)
        @crunch_company.update_attribute(:ipo_ticker, @fetch_crunch_ipo_ticker)
        @crunch_company.update_attribute(:posts, @fetch_crunch_posts)
        format.html { redirect_to @crunch_company, notice: 'Crunch company was successfully created.' }
        format.json { render json: @crunch_company, status: :created, location: @crunch_company }
      else
        format.html { render action: "new" }
        format.json { render json: @crunch_company.errors, status: :unprocessable_entity }
      end
    end
  end
end
