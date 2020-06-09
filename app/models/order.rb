class Order < ApplicationRecord

	belongs_to :user
	has_many :order_details, dependent: :destroy

	enum payment:{'クレジットカード':0,'銀行振り込み':1}
	attribute :payment, :integer, default: 0
	enum order_status:{'入金待ち':0,'入金確認':1,'製作中':2,'発送準備中':3, '発送完了':4}
	attribute :order_status, :integer, default: 0

	attribute :postage, :integer, default: 800
end
