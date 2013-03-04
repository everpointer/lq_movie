class SessionOrder < ActiveRecord::Base
  serialize :choosed_seats, Array

  belongs_to :movie_session

  attr_accessible :choosed_seats, :expense, :mobile, :order_id, :movie_session_id, :status

  after_create :set_order_id

  validates_presence_of :choosed_seats, :expense, :movie_session_id

  private

  def set_order_id
    self.order_id = self.created_at.to_i.to_s + "%06d" % SecureRandom.random_number(999999)
    self.save!
  end

end
