class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = 'You must enter a stock symbol to look up. '
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = 'The stock symbol you\'ve entered cannot be found. ' unless @stock
    end
    respond_to do |format|
      format.js { render partial: '/users/result' }
    end
  end

end