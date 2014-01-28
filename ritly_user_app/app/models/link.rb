# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  full_url   :string(255)
#  ritly_url  :string(255)
#  visits     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
end
