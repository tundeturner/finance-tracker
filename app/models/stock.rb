class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.new_from_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.company_name,
          ticker: looked_up_stock.symbol,
          last_price: looked_up_stock.latest_price,
          previous_close: looked_up_stock.previous_close,
          change_percent: looked_up_stock.change_percent,
          ytd_change_percent: looked_up_stock.ytd_change)
    rescue Exception => e
      return nil
    end
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.refresh_all_prices
    all.each do |s|
      looked_up_stock = StockQuote::Stock.quote(s.ticker)
      s.last_price = looked_up_stock.latest_price
      s.previous_close = looked_up_stock.previous_close
      s.change_percent = looked_up_stock.change_percent
      s.ytd_change_percent = looked_up_stock.ytd_change
      s.save
    end
  end
end
