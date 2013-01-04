module Mine
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def allattr option = false
      
      ex = [:id, :created_at , :updated_at]
      ex += option[:ex] if option && option[:ex]
      
      on = (option && option[:only]) ?  option[:only] : []
      
      all = self.new.attributes.keys.map{|i| i.to_sym}
      all_e = all.clone
      all_e.each do |i| 
        all.delete( i ) if ex.include?(i) and !on.include?(i)
        all.delete( i ) if on.size > 0 && !on.include?(i) 
      end
      all
    end
  end
end
ActiveRecord::Base.send :include , Mine