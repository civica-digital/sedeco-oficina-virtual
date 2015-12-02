FactoryGirl.define do
  factory :admin do
    email "admin@admin.mail"
    password "secret123"
    password_confirmation "secret123"
  end
end