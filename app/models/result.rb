# -*- encoding : utf-8 -*-
class Result < ActiveRecord::Base
  
  def self.typetransaction
    all_typetransactions = Typetransaction.all
    need_transaction = {}
    all_typetransactions.each do |a|
      case a.name
      when "sale"
        need_transaction["buy"] = a.id
      when "rent"
        need_transaction["rent"] = a.id
      when "exchange"
        need_transaction["exchange"] = a.id
      end
    end
    return need_transaction
  end
  
end
