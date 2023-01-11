FactoryBot.define do
  factory :journey do
    from {'Lahore'}
    to {'Karachi'}
    departure {'Fri, 09 Dec 2022 02:08:49 -0500'}
    rate {33}
    capacity {34}
  end
end
