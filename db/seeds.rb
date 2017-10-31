Pledge.destroy_all
Reward.destroy_all
User.destroy_all
Project.destroy_all

5.times do
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
              goal: rand(100000),
              start_date: Time.now.utc,
              end_date: Time.now.utc + rand(10).days,
              user: User.all.sample
            )

  5.times do
    project.rewards.create!(
      description: Faker::Superhero.power,
      dollar_amount: rand(1..100),
    )
  end
    3.times do
      project.project_updates.create!(
        title: Faker::App.name,
        description: Faker::Lorem.paragraph,
        project: project
      )
  end

end

20.times do
  project = Project.all.sample
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )

  Pledge.create!(
    user: user,
    project: project,
    dollar_amount: project.rewards.sample.dollar_amount + rand(10)
  )
end

Tag.create!(name: "Art")
Tag.create!(name: "Design")
Tag.create!(name: "Technology")
Tag.create!(name: "Film")
Tag.create!(name: "Science")

Project.all.each do |project|
  tags = Tag.pluck(:id)
  rand(2..4).times do
    tag = Tag.find(tags.sample)
    unless project.tags.include? tag
      project.tags << tag
    end
  end
end
