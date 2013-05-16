
NUMBER_USERS = 200
NUMBER_QUESTIONS = 15
NUMBER_ANSWERS = NUMBER_QUESTIONS * 3

NUMBER_USERS.times do
  User.create(
    { :handle => Faker::Internet.user_name,
      :email => Faker::Internet.safe_email,
      :password => '123456'}, 
    :without_protection => true
  )
end
users = User.all

NUMBER_QUESTIONS.times do
  Question.create(
    { :user => users.sample,
      :title => Faker::Company.catch_phrase,
      :content => Faker::Company.bs},
    :without_protection => true
  )
end
questions = Question.all

NUMBER_ANSWERS.times do
  Answer.create(
    { :user => users.sample,
      :content => Faker::Company.bs,
      :question_id => questions.sample.id},
    :without_protection => true
  )
end
answers = Answer.all

# Vote for questions
users.each do |user|
  questions.each do |question|
    Vote.create(
      { :user => user,
        :votable => question,
        :value => [-1,0,1,1,1].sample},
      :without_protection => true
    )
  end
end

# Vote for answers
users.each do |user|
  answers.each do |answer|
    Vote.create(
      { :user => user,
        :votable => answer,
        :value => [-1,0,1,1,1].sample},
      :without_protection => true
    )
  end
end
