class HomeController < ApplicationController

    def index
        #@transactions = Transaction.all
        if params[:currency]
            @transactions = Transaction.where(currency: params[:currency])
        else
            @transactions = Transaction.all.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
        end

        @sum = @transactions.sum { |transaction| transaction.total }
    end
end