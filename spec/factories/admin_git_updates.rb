# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_git_update, :class => 'Admin::GitUpdate' do
    comment "MyString"
    hashtag "MyString"
    commit 1
    commiter "MyString"
  end
end
