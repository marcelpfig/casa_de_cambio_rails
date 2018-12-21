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
          render :new
        end
    end

    def edit
        @transaction = Transaction.find(params[:id])
    end

    def update
        @transaction = Transaction.find(params[:id])

        if @transaction.update(transaction_params)
            redirect_to @transaction
        else
            render :edit
        end
    end

    def destroy
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
        redirect_to root_path, notice:'Transação apagada com sucesso!'
    end
    
    private
    
    def transaction_params
        params.require(:transaction).permit(:amount, :currency, :transaction_type, :quotation, :user_id)
    end
    

end