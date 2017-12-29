# == Schema Information
#
# Table name: housings
#
#  id             :integer          not null, primary key
#  city           :string
#  beds           :integer
#  length_of_stay :string
#  pets_accepted  :boolean
#  pet_notes      :text
#  contact_name   :string
#  phone_number   :string
#  email_address  :string
#  notes          :text
#  user_id        :integer
#  status         :string           default("available")
#  verified       :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  paid           :boolean
#  neighborhood   :string
#  housing_type   :string
#  has_animals    :boolean
#  price          :string
#

require 'test_helper'

class HousingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
