# Clear existing data
Lesson.destroy_all
ContentPage.destroy_all
AssessmentPage.destroy_all

# Define lesson titles
lesson_titles = [
  "Intro to C++",
  "Variables",
  "Expressions",
  "Conditionals",
  "Loops",
  "Functions",
  "Classes",
  "Arrays",
  "Vectors",
  "Pointers"
]

lesson_titles.each do |title|
  lesson = Lesson.create!(title: title)

  if title == "Intro to C++"
    # Real content for Lesson 1
    lesson.content_pages.create!(
      title: "#{title} - Introduction",
      body: "<h2>Welcome to C++</h2><p>This lesson introduces C++ and includes examples, features, and quiz questions. See the website for full formatting.</p>"
    )
    lesson.assessment_pages.create!(
      title: "#{title} - Assessment",
      content: "<p>Assessment for Intro to C++. Check your understanding of systems programming and C++ basics.</p>"
    )
  else
    if title == "Variables"
      lesson.content_pages.create!(
        title: "Variables - Introduction",
        body: <<~HTML
          <h2>Understanding Variables</h2>
          <p>In C++, variables are used to store information that your program can manipulate. Each variable must be declared with a type before it is used.</p>
          <div class="lesson-section card-tile">
            <h4>💡 Quick Tip</h4>
            <p>Variable names are case-sensitive and must start with a letter or underscore. C++ is statically typed, so types must be declared explicitly.</p>
          </div>
          <h2>Basic Variable Types</h2>
          <pre class="code-box">
  int age = 25;
  double weight = 65.5;
  char grade = 'A';
  bool isStudent = true;
          </pre>
          <div class="lesson-section card-tile">
            <h4>Quick Check #1</h4>
            <p>Which of the following correctly declares a boolean variable in C++?</p>
            <form>
              <label><input type="radio" name="q1" value="wrong"> bool isStudent = "yes";</label><br>
              <label><input type="radio" name="q1" value="correct"> bool isStudent = true;</label><br>
              <label><input type="radio" name="q1" value="wrong"> boolean isStudent = 1;</label><br><br>
              <button type="button" onclick="checkAnswer('q1', 'feedback1')" class="btn btn-sm btn-outline-dark">Check Answer</button>
              <p id="feedback1" class="feedback-text"></p>
            </form>
          </div>
          <h2>Declaring vs. Initializing</h2>
          <p>You can declare a variable first and assign it later:</p>
          <pre class="code-box">
  int score;
  score = 100;
          </pre>
          <div class="lesson-section card-tile">
            <h4>Quick Check #2</h4>
            <p>What happens if you use a variable before declaring it?</p>
            <form>
              <label><input type="radio" name="q2" value="correct"> The compiler throws an error.</label><br>
              <label><input type="radio" name="q2" value="wrong"> It automatically sets it to zero.</label><br>
              <label><input type="radio" name="q2" value="wrong"> It uses a default value depending on type.</label><br><br>
              <button type="button" onclick="checkAnswer('q2', 'feedback2')" class="btn btn-sm btn-outline-dark">Check Answer</button>
              <p id="feedback2" class="feedback-text"></p>
            </form>
          </div>
        HTML
      )
    else
      lesson.content_pages.create!(
        title: "#{title} - Introduction",
        body: "<p>This is a placeholder introduction for #{title}. Unique content coming soon.</p>"
      )
    end
    lesson.assessment_pages.create!(
      title: "#{title} - Assessment",
      content: "<p>This is a placeholder assessment for #{title}.</p>"
    )
  end
end

puts "Seeded 10 lessons: full content for Lesson 1, placeholders for the rest."
