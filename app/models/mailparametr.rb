class Mailparametr < ApplicationRecord
  validate :only_one_row, on: :create

  private

  def only_one_row
    if Mailparametr.exists?
      errors.add(:base, "Может существовать только одна запись")
    end
  end
end
