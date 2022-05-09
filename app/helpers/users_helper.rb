module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end

  def header_color(user)
    "#{user.header_color}"
  end
end
