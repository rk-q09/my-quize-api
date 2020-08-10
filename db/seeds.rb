user1 = User.create(user_name: "Admin User", email: "admin@test.com", password: "password", password_confirmation: "password")

quize1 = user1.quizes.create(title: "四則演算")

question1 = quize1.questions.create(content: "1+1=")
question2 = quize1.questions.create(content: "1+2=")
question3 = quize1.questions.create(content: "1+3=")
question4 = quize1.questions.create(content: "1+4=")

choice1_1 = question1.choices.create(content: "2", is_answer: true)
choice1_2 = question1.choices.create(content: "3", is_answer: false)
choice1_3 = question1.choices.create(content: "4", is_answer: false)
choice1_4 = question1.choices.create(content: "5", is_answer: false)

choice2_1 = question2.choices.create(content: "3", is_answer: true)
choice2_2 = question2.choices.create(content: "6", is_answer: false)
choice2_3 = question2.choices.create(content: "7", is_answer: false)
choice2_4 = question2.choices.create(content: "8", is_answer: false)

choice3_1 = question3.choices.create(content: "4", is_answer: true)
choice3_2 = question3.choices.create(content: "9", is_answer: false)
choice3_3 = question3.choices.create(content: "10", is_answer: false)
choice3_4 = question3.choices.create(content: "11", is_answer: false)

choice4_1 = question4.choices.create(content: "5", is_answer: true)
choice4_2 = question4.choices.create(content: "12", is_answer: false)
choice4_3 = question4.choices.create(content: "13", is_answer: false)
choice4_4 = question4.choices.create(content: "14", is_answer: false)
