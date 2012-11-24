# -*- encoding : utf-8 -*-
class Customeraccess < ActiveRecord::Base
  def self.types
    {"All" => true, "leading realtors" => false}
  end
end
