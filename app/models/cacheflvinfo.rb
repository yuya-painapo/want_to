class Cacheflvinfo < ActiveRecord::Base
	serialize :flvinfo, Hash 
end
