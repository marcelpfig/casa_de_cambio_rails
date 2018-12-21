class Transaction < ApplicationRecord

    belongs_to :user
    validates :amount, :currency, :transaction_type, :quotation, :user_id, presence: true

    def currency_to_ptbr
        return 'Dólar' if self.currency == 'dollar'
        'Real'
    end

    def transaction_type_to_ptbr
        return 'Venda' if self.transaction_type == 'sell'
        'Compra'
    end

    def show_total_in_dollars
        "$ #{"-" if self.transaction_type == 'sell'}#{"%.2f" % (self.currency == 'real' ? self.amount.to_f/self.quotation : self.amount.to_f)}"
    end

    def total
        if self.currency == 'dollar'
            return -(self.amount).to_f if self.transaction_type == 'sell'
      
            self.amount.to_f
          else
            dollar_amount = self.amount.to_f/self.quotation.to_f
            return -(dollar_amount).to_f if self.transaction_type == 'sell'
      
            dollar_amount.to_f
          end
    end
end
