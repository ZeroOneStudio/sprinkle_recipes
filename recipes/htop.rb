package :htop do
  description 'htop utility'

  apt 'htop'

  verify do
    has_file '/usr/bin/htop'
  end
end
