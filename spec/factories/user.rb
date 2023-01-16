FactoryBot.define do
  factory :user do
    first_name {'test sender'}
    last_name {'random user'}
    email {'random@sender.com'}
    password {'12345678'}
    country {'Lahore'}
    contact {632147}
    role {'sender'}
  end
end
