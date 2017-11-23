require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "can create project member" do
    member = build(:member)
    member.save
    assert member.persisted?
  end

  test "cannot create member if project does not exist" do
    member = build(:member, project: nil)
    member.project = build(:project)
    member.save
    refute member.persisted?
  end

  test "cannot create member if user does not exist" do
    member = build(:member, user: nil)
    member.user = build(:user)
    member.save
    refute member.persisted?
  end

# 2. cannot create member if project/user does not exist
# 3. only project owner can assign/edit/delete role to member
# 4. only project owner can create member
end
