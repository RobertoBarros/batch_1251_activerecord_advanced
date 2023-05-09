class Doctor < ActiveRecord::Base
  has_many :interns
  has_many :consultations
  has_many :patients, through: :consultations

  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  after_create :send_mail

  private

  def send_mail
    puts '-' * 50
    puts "Email enviado para o doctor #{first_name} #{last_name}"
    puts '-' * 50
  end

end
