class CrunchCompany
  include Mongoid::Document
  field :company_name, type: String
  field :posts, type: String
  field :ipo_valuation, type: String
  field :ipo_year, type: String
  field :ipo_ticker, type: String
end
