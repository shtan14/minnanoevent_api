module UserHelpers
  def active_user
    User.find_by(activated: true)
  end
end
