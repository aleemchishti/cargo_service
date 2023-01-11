FactoryBot.define do
  factory :order do
    sender_name {'test sender'}
    receiver_name {'test receiver'}
    from {'Lahore'}
    to {'Karachi'}
    weight {33}
    contact {632147}
  end
end
