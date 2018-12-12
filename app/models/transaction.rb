class Transaction < ApplicationRecord

    validates :amount, :currency, :transaction_type, :quotation, presence: true

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
end
