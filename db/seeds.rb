15.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )
end

10.times do
  project = Project.create!(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph,
    hard_deadline: Time.now.utc + rand(10).days,
    user: User.all.sample
  )


  5.times do
    members = Member.create!(
      project: project,
      user: User.all.sample
    )
  end

  7.times do
    Task.create!(
      task_body: Faker::Lorem.paragraph,
      priority: rand(1..3),
      user: project.members.sample.user,
      project: project,
      assigned_by_owner: Faker::Boolean.boolean
    )
  end

  20.times do
    Message.create!(
      project: project,
      user: project.members.sample.user,
      message_body: Faker::Lorem.paragraph,
      announcement: Faker::Boolean.boolean
    )
  end

end
