#名前生成 → https://namegen.jp/

#講師
Teacher.create(
    email: "teacher1@example.com",
    first_name: "祐二",
    last_name: "箱根",
    password: 'pass',
    course: "文系"
  )
Teacher.create(
    email: "teacher2@example.com",
    password: 'pass',
    first_name: "和樹",
    last_name: "三輪",
    course: "文系"
  )
Teacher.create(
    email: "teacher3@example.com",
    password: 'pass',
    first_name: "一平",
    last_name: "刀根",
    course: "理系"
  )

Teacher.create(
    email: "teacher4@example.com",
    password: 'pass',
    first_name: "敏明",
    last_name: "谷島",
    course: "文系"
  )    

Teacher.create(
    email: "teacher5@example.com",
    password: 'pass',
    first_name: "省吾",
    last_name: "蓮田",
    course: "理系"
  )  
#生徒  

Student.create(
    email: "student1@example.com",
    password: 'pass',
    first_name: "正弘",
    last_name: "横見",
    grade: 7
  )  
  
Student.create(
    email: "student2@example.com",
    password: 'pass',
    first_name: "洋二",
    last_name: "小國",
    grade: 10
  )  
  
Student.create(
    email: "student3@example.com",
    password: 'pass',
    first_name: "哲夫",
    last_name: "木坂",
    grade: 3
  )  

Student.create(
    email: "student4@example.com",
    password: 'pass',
    first_name: "佑樹",
    last_name: "竹添",
    grade: 9
  )  

Student.create(
    email: "student5@example.com",
    password: 'pass',
    first_name: "信一郎",
    last_name: "赤江",
    grade: 5
  )  


Lesson.create(teacher_id: 1, student_id: 1, lesson_date: Date.today, unit: "２次関数の最大最小" , subject: "数学", teaching_material: "青チャート数１A")
Lesson.create(teacher_id: 1, student_id: 1, lesson_date: Date.today, unit: "論説文②", subject: "国語", teaching_material: "極める現代文")
Lesson.create(teacher_id: 1, student_id: 3, lesson_date: Date.today, unit: "Unit1,2", subject: "英語", teaching_material: "ハイパートレーニング(超基礎編)")
Lesson.create(teacher_id: 2, student_id: 3, lesson_date: Date.today, unit: "運動方程式、円運動", subject: "物理", teaching_material: "東洋大過去問")
Lesson.create(teacher_id: 5, student_id: 4, lesson_date: Date.today, unit: "三権分立", subject: "社会", teaching_material: "ビルダー")
Lesson.create(teacher_id: 3, student_id: 3, lesson_date: Date.today, unit: "二次方程式、解の公式", subject: "数学", teaching_material: "フォレスタ")

Report.create(lesson_id: 1, content:"よくできていました", exercise: "190pの例題", comprehension_lesson: 3, attitude: 3, done_homework: "完了", comprehension_homework: 4, homework: "青チャートの191p")
Report.create(lesson_id: 2, content:"前回よりもよくできていました", exercise: "10pの例題", comprehension_lesson: 4, attitude: 5, done_homework: "途中まで", comprehension_homework: 3, homework: "季節講習中のためなし")
Report.create(lesson_id: 3, content:"よく復習しましょう", exercise: "11,12p", comprehension_lesson: 5, attitude: 2, done_homework: "やってない", comprehension_homework: 5, homework: "unit1,2")
Report.create(lesson_id: 4, content:"あまり集中できていませんでした", exercise: "今日解いた問題の解き直し", comprehension_lesson: 4, attitude: 4, done_homework: "完了", comprehension_homework: 1, homework: "円運動の例題の解き直し")
Report.create(lesson_id: 5, content:"解き直しをするように", exercise: "99p", comprehension_lesson: 2, attitude: 3, done_homework: "途中まで", comprehension_homework: 0, homework: "eナビプリント5枚")
Report.create(lesson_id: 6, content:"字が綺麗ですね", exercise: "eナビプリント2枚", comprehension_lesson: 4, attitude: 4, done_homework: "完了", comprehension_homework: 5, homework: "フォレスタ50p〜56p")
