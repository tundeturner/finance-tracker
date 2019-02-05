class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: '/users/result' }
        end
      else
        flash[:danger] = 'The stock symbol you\'ve entered cannot be found.'
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = 'You must enter a stock symbol to look up.'
      redirect_to my_portfolio_path
    end
  end
end