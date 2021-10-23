class Order < ApplicationRecord

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum address_option: {　ご自身の住所: 0, 選択済み住所: 1,　新しいお届け先: 2 }

    belongs_to :customer


    def sum_of_price
    item.price * amount
    end

    def add_tax_price
    price * 1.1
    end
end
