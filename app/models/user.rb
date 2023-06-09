class User < ApplicationRecord
  acts_as_favoritor

  has_one_attached :avatar
  has_one_attached :banner

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :reviews, through: :attendances
  has_many :concerts, through: :attendances

  acts_as_followable
  acts_as_follower

  def attended?(concert)
    !find_attendance(concert).nil?
  end

  def attendance_info(concert)
    find_attendance(concert)
  end

  private

  def find_attendance(concert)
    Attendance.find_by(concert: concert, user: self)
  end
end
