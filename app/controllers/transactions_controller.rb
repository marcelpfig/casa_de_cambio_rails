class TransactionsController < ApplicationController

    def index
        @transactions = Transaction.all
    end
    
    def show
        @transaction = Transaction.find(params[:id])
    end
    
    def new
        @transaction = Transaction.new
    end
    
    def create
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
          redirect_to @transaction
        else
          flash[:alert] = 'Você deve informar todos os dados da receita'
        end
    end
    
    private
    
    def transaction_params
        params.require(:transaction).permit(:amount, :currency, :transaction_type)
    end
    

end