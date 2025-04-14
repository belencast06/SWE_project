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

  case title
  when "Intro to C++"
    lesson.content_pages.create!(
      title: "Intro to C++ - Introduction",
      body: "<h2>Welcome to C++</h2><p>This lesson introduces C++ and includes examples, features, and quiz questions. See the website for full formatting.</p>"
    )
    lesson.assessment_pages.create!(
      title: "Intro to C++ - Assessment",
      content: "<p>Assessment for Intro to C++. Check your understanding of systems programming and C++ basics.</p>"
    )

  when "Variables"
    lesson.content_pages.create!(
      title: "Variables - Introduction",
      body: <<~HTML
        <h2>Understanding Variables</h2>
        <p>In C++, variables are used to store information that your program can manipulate. Each variable must be declared with a type before it is used.</p>

        <div class=\"lesson-section card-tile\">
          <h4>💡 Quick Tip</h4>
          <p>Variable names are case-sensitive and must start with a letter or underscore. C++ is statically typed, so types must be declared explicitly.</p>
        </div>

        <h2>Basic Variable Types</h2>
        <pre class=\"code-box\">
            int age = 25;
            double weight = 65.5;
            char grade = 'A';
            bool isStudent = true;
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #1</h4>
          <p>Which of the following correctly declares a boolean variable in C++?</p>
          <form>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> bool isStudent = \"yes\";</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"correct\"> bool isStudent = true;</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> boolean isStudent = 1;</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q1', 'feedback1')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback1\" class=\"feedback-text\"></p>
          </form>
        </div>

        <h2>Declaring vs. Initializing</h2>
        <p>You can declare a variable first and assign it later:</p>

        <pre class=\"code-box\">
          int score;
          score = 100;
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #2</h4>
          <p>What happens if you use a variable before declaring it?</p>
          <form>
            <label><input type=\"radio\" name=\"q2\" value=\"correct\"> The compiler throws an error.</label><br>
            <label><input type=\"radio\" name=\"q2\" value=\"wrong\"> It automatically sets it to zero.</label><br>
            <label><input type=\"radio\" name=\"q2\" value=\"wrong\"> It uses a default value depending on type.</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q2', 'feedback2')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback2\" class=\"feedback-text\"></p>
          </form>
        </div>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Variables - Assessment",
      content: "<p>This is a placeholder assessment for Variables.</p>"
    )

  when "Expressions"
    lesson.content_pages.create!(
      title: "Expressions - Introduction",
      body: <<~HTML
        <h2>What Are Expressions?</h2>
        <p>An <strong>expression</strong> in C++ is a combination of variables, constants, and operators that evaluates to a value. They're the building blocks of logic and computation in any program.</p>

        <div class=\"lesson-section card-tile\">
          <h4>🧠 Think About It</h4>
          <p>Any time you use <code>age + 5</code> or <code>a * b</code>, you're using an expression. They can be simple or complex.</p>
        </div>

        <h2>Common Operators</h2>
        <pre class=\"code-box\">
// Arithmetic
int sum = 5 + 2;        // 7
int product = 3 * 4;    // 12
int quotient = 10 / 2;  // 5

// Comparison
bool isEqual = (5 == 5);  // true
bool isLarger = (3 > 7);  // false

// Logical
bool result = (true && false); // false
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #1</h4>
          <p>What will be the result of this expression: <code>10 - 3 * 2</code>?</p>
          <form>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> 14</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"correct\"> 4</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> 7</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q1', 'feedback1')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback1\" class=\"feedback-text\"></p>
          </form>
        </div>

        <h2>Expression Types</h2>
        <ul>
          <li><strong>Arithmetic Expressions:</strong> Use math operators</li>
          <li><strong>Relational Expressions:</strong> Compare values and return a boolean</li>
          <li><strong>Logical Expressions:</strong> Combine conditions using <code>&&</code>, <code>||</code>, <code>!</code></li>
        </ul>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #2</h4>
          <p>Which expression evaluates to true?</p>
          <form>
            <label><input type=\"radio\" name=\"q2\" value=\"wrong\"> (10 < 5) && (3 > 1)</label><br>
            <label><input type=\"radio\" name=\"q2\" value=\"correct\"> (4 == 4) || (2 > 10)</label><br>
            <label><input type=\"radio\" name=\"q2\" value=\"wrong\"> !(5 == 5)</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q2', 'feedback2')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback2\" class=\"feedback-text\"></p>
          </form>
        </div>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Expressions - Assessment",
      content: "<p>This is a placeholder assessment for Expressions.</p>"
    )

  when "Conditionals"
    lesson.content_pages.create!(
      title: "Conditionals - Introduction",
      body: <<~HTML
        <h2>Controlling the Flow</h2>
        <p>Conditionals in C++ let your program make decisions. You can run specific blocks of code depending on whether a condition is true or false.</p>

        <div class=\"lesson-section card-tile\">
          <h4>💡 Quick Tip</h4>
          <p>Use <code>if</code>, <code>else if</code>, and <code>else</code> to build flexible decision logic.</p>
        </div>

        <h2>Basic If Statement</h2>
        <pre class=\"code-box\">
int age = 18;
if (age >= 18) {
  cout << "You are an adult.";
}
        </pre>

        <h2>If-Else Ladder</h2>
        <pre class=\"code-box\">
int score = 85;
if (score > 90) {
  cout << "Excellent";
} else if (score > 75) {
  cout << "Good job";
} else {
  cout << "Keep trying";
}
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #1</h4>
          <p>What does this code print if <code>age = 20</code>?</p>
          <pre class=\"code-box\">
if (age >= 18) {
  cout << "Adult";
} else {
  cout << "Minor";
}
          </pre>
          <form>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> Minor</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"correct\"> Adult</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> Nothing</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q1', 'feedback1')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback1\" class=\"feedback-text\"></p>
          </form>
        </div>

        <h2>Using Boolean Logic</h2>
        <p>You can combine conditions using <code>&&</code> (and), <code>||</code> (or), and <code>!</code> (not).</p>

        <pre class=\"code-box\">
bool isSunny = true;
bool isWeekend = false;

if (isSunny && isWeekend) {
  cout << "Go outside!";
} else {
  cout << "Stay in and code.";
}
        </pre>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Conditionals - Assessment",
      content: "<p>This is a placeholder assessment for Conditionals.</p>"
    )

  when "Loops"
    lesson.content_pages.create!(
      title: "Loops - Introduction",
      body: <<~HTML
        <h2>Repeating Code with Loops</h2>
        <p>Loops in C++ let you repeat blocks of code efficiently. They are essential when you want to automate repetitive tasks.</p>

        <div class=\"lesson-section card-tile\">
          <h4>🌀 Loop Types</h4>
          <p>The main types of loops are <code>for</code>, <code>while</code>, and <code>do-while</code>.</p>
        </div>

        <h2>For Loop</h2>
        <pre class=\"code-box\">
for (int i = 0; i < 5; i++) {
  cout << i << endl;
}
        </pre>

        <h2>While Loop</h2>
        <pre class=\"code-box\">
int i = 0;
while (i < 5) {
  cout << i << endl;
  i++;
}
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #1</h4>
          <p>What is the output of the following code?</p>
          <pre class=\"code-box\">
for (int i = 1; i <= 3; i++) {
  cout << i * 2 << " ";
}
          </pre>
          <form>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> 2 3 4</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"correct\"> 2 4 6</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> 1 2 3</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q1', 'feedback1')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback1\" class=\"feedback-text\"></p>
          </form>
        </div>

        <h2>Do-While Loop</h2>
        <p>Executes the loop body at least once.</p>
        <pre class=\"code-box\">
int i = 0;
do {
  cout << i << endl;
  i++;
} while (i < 3);
        </pre>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Loops - Assessment",
      content: "<p>This is a placeholder assessment for Loops.</p>"
    )

  when "Functions"
    lesson.content_pages.create!(
      title: "Functions - Introduction",
      body: <<~HTML
        <h2>Understanding Functions</h2>
        <p>Functions help break your program into reusable blocks. They accept input, perform operations, and return a result.</p>

        <div class=\"lesson-section card-tile\">
          <h4>💡 Tip</h4>
          <p>Functions make your code easier to test, debug, and understand. They reduce repetition and improve organization.</p>
        </div>

        <h2>Defining a Function</h2>
        <pre class=\"code-box\">
int add(int a, int b) {
  return a + b;
}
        </pre>

        <h2>Calling a Function</h2>
        <pre class=\"code-box\">
int result = add(5, 3);
cout << result;  // Output: 8
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #1</h4>
          <p>What is the return type of this function?</p>
          <pre class=\"code-box\">
int multiply(int x, int y) {
  return x * y;
}
          </pre>
          <form>
            <label><input type=\"radio\" name=\"q1\" value=\"correct\"> int</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> void</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> bool</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q1', 'feedback1')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback1\" class=\"feedback-text\"></p>
          </form>
        </div>

        <h2>Void Functions</h2>
        <p>If a function doesn’t return a value, use <code>void</code>.</p>
        <pre class=\"code-box\">
void greet() {
  cout << "Hello!";
}
        </pre>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Functions - Assessment",
      content: "<p>This is a placeholder assessment for Functions.</p>"
    )
  when "Classes"
    lesson.content_pages.create!(
      title: "Classes - Introduction",
      body: <<~HTML
        <h2>Object-Oriented Programming</h2>
        <p>Classes are the foundation of object-oriented programming in C++. They allow you to group data and functions together into one entity.</p>

        <div class=\"lesson-section card-tile\">
          <h4>💼 Real-World Analogy</h4>
          <p>Think of a class as a blueprint. You can create multiple "objects" (instances) from it, just like building multiple houses from one architectural plan.</p>
        </div>

        <h2>Defining a Class</h2>
        <pre class=\"code-box\">
class Car {
public:
  string brand;
  int year;

  void honk() {
    cout << "Beep!";
  }
};
        </pre>

        <h2>Using a Class</h2>
        <pre class=\"code-box\">
Car myCar;
myCar.brand = "Toyota";
myCar.year = 2020;
myCar.honk();
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #1</h4>
          <p>What keyword is used to define a class in C++?</p>
          <form>
            <label><input type=\"radio\" name=\"q1\" value=\"correct\"> class</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> struct</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> function</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q1', 'feedback1')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback1\" class=\"feedback-text\"></p>
          </form>
        </div>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Classes - Assessment",
      content: "<p>This is a placeholder assessment for Classes.</p>"
    )
  when "Arrays"
    lesson.content_pages.create!(
      title: "Arrays - Introduction",
      body: <<~HTML
        <h2>Introduction to Arrays</h2>
        <p>Arrays in C++ allow you to store multiple values of the same type in a single, indexed collection. They are fixed in size and indexed from 0.</p>

        <div class=\"lesson-section card-tile\">
          <h4>📦 Use Case</h4>
          <p>Use arrays when you need to store and access a collection of elements like scores, temperatures, or items in a list.</p>
        </div>

        <h2>Declaring and Initializing Arrays</h2>
        <pre class=\"code-box\">
int scores[5];  // declares an array of 5 integers
int ages[3] = {18, 21, 25};
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #1</h4>
          <p>What is the index of the first element in a C++ array?</p>
          <form>
            <label><input type=\"radio\" name=\"q1\" value=\"correct\"> 0</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> 1</label><br>
            <label><input type=\"radio\" name=\"q1\" value=\"wrong\"> -1</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q1', 'feedback1')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback1\" class=\"feedback-text\"></p>
          </form>
        </div>

        <h2>Accessing and Modifying Elements</h2>
        <pre class=\"code-box\">
int temperatures[4] = {72, 75, 78, 80};
temperatures[2] = 79; // modifies the third element
cout << temperatures[2]; // prints 79
        </pre>

        <div class=\"lesson-section card-tile\">
          <h4>Quick Check #2</h4>
          <p>What happens if you access an index beyond the array size?</p>
          <form>
            <label><input type=\"radio\" name=\"q2\" value=\"wrong\"> The program auto-extends the array</label><br>
            <label><input type=\"radio\" name=\"q2\" value=\"wrong\"> A new element is created</label><br>
            <label><input type=\"radio\" name=\"q2\" value=\"correct\"> It results in undefined behavior</label><br><br>
            <button type=\"button\" onclick=\"checkAnswer('q2', 'feedback2')\" class=\"btn btn-sm btn-outline-dark\">Check Answer</button>
            <p id=\"feedback2\" class=\"feedback-text\"></p>
          </form>
        </div>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Arrays - Assessment",
      content: "<p>This is a placeholder assessment for Arrays.</p>"
    )
  when "Vectors"
    lesson.content_pages.create!(
      title: "Vectors - Introduction",
      body: <<~HTML
        <h2>What Are Vectors?</h2>
        <p>Vectors are dynamic arrays provided by the C++ Standard Template Library (STL). They can grow or shrink in size automatically and are a powerful alternative to raw arrays.</p>

        <div class="lesson-section card-tile">
          <h4>💡 Quick Tip</h4>
          <p>Always include <code>&lt;vector&gt;</code> and use <code>std::vector</code> when working with vectors.</p>
        </div>

        <h2>Declaring and Using Vectors</h2>
        <pre class="code-box">
#include &lt;vector&gt;
#include &lt;iostream&gt;
using namespace std;

int main() {
  vector&lt;int&gt; numbers = {1, 2, 3};
  numbers.push_back(4);  // Add an element
  cout &lt;&lt; numbers[0];    // Access element
}
        </pre>

        <div class="lesson-section card-tile">
          <h4>Quick Check #1</h4>
          <p>Which method is used to add an element to a vector?</p>
          <form>
            <label><input type="radio" name="q1" value="wrong"> add()</label><br>
            <label><input type="radio" name="q1" value="wrong"> insert()</label><br>
            <label><input type="radio" name="q1" value="correct"> push_back()</label><br><br>
            <button type="button" onclick="checkAnswer('q1', 'feedback1')" class="btn btn-sm btn-outline-dark">Check Answer</button>
            <p id="feedback1" class="feedback-text"></p>
          </form>
        </div>

        <h2>Looping Through Vectors</h2>
        <pre class="code-box">
for (int i = 0; i &lt; numbers.size(); i++) {
  cout &lt;&lt; numbers[i] &lt;&lt; " ";
}
        </pre>

        <div class="lesson-section card-tile">
          <h4>Quick Check #2</h4>
          <p>How do you find the number of elements in a vector?</p>
          <form>
            <label><input type="radio" name="q2" value="wrong"> length()</label><br>
            <label><input type="radio" name="q2" value="wrong"> count()</label><br>
            <label><input type="radio" name="q2" value="correct"> size()</label><br><br>
            <button type="button" onclick="checkAnswer('q2', 'feedback2')" class="btn btn-sm btn-outline-dark">Check Answer</button>
            <p id="feedback2" class="feedback-text"></p>
          </form>
        </div>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Vectors - Assessment",
      content: "<p>This is a placeholder assessment for Vectors.</p>"
    )
  when "Pointers"
    lesson.content_pages.create!(
      title: "Pointers - Introduction",
      body: <<~HTML
        <h2>Understanding Pointers</h2>
        <p>A pointer is a variable that stores the memory address of another variable. Pointers are powerful and give direct access to memory in C++.</p>

        <div class="lesson-section card-tile">
          <h4>📌 Key Point</h4>
          <p>Use the <code>*</code> symbol to declare a pointer and the <code>&</code> operator to get the address of a variable.</p>
        </div>

        <h2>Declaring and Using Pointers</h2>
        <pre class="code-box">
int value = 42;
int* ptr = &value;
cout << *ptr;  // Output: 42
        </pre>

        <div class="lesson-section card-tile">
          <h4>Quick Check #1</h4>
          <p>What does the <code>*</code> symbol do when used with a pointer?</p>
          <form>
            <label><input type="radio" name="q1" value="wrong"> Gets the address</label><br>
            <label><input type="radio" name="q1" value="correct"> Dereferences the pointer</label><br>
            <label><input type="radio" name="q1" value="wrong"> Declares a variable</label><br><br>
            <button type="button" onclick="checkAnswer('q1', 'feedback1')" class="btn btn-sm btn-outline-dark">Check Answer</button>
            <p id="feedback1" class="feedback-text"></p>
          </form>
        </div>

        <h2>Null Pointers</h2>
        <p>You can initialize pointers to <code>nullptr</code> to indicate they point to nothing.</p>
        <pre class="code-box">
int* p = nullptr;
if (p == nullptr) {
  cout << "Pointer is null.";
}
        </pre>

        <div class="lesson-section card-tile">
          <h4>Quick Check #2</h4>
          <p>What keyword is used to represent an empty pointer in modern C++?</p>
          <form>
            <label><input type="radio" name="q2" value="wrong"> NULL</label><br>
            <label><input type="radio" name="q2" value="correct"> nullptr</label><br>
            <label><input type="radio" name="q2" value="wrong"> empty</label><br><br>
            <button type="button" onclick="checkAnswer('q2', 'feedback2')" class="btn btn-sm btn-outline-dark">Check Answer</button>
            <p id="feedback2" class="feedback-text"></p>
          </form>
        </div>
      HTML
    )
    lesson.assessment_pages.create!(
      title: "Pointers - Assessment",
      content: "<p>This is a placeholder assessment for Pointers.</p>"
    )
  else
    lesson.content_pages.create!(
      title: "#{title} - Introduction",
      body: "<p>This is a placeholder introduction for #{title}. Unique content coming soon.</p>"
    )
    lesson.assessment_pages.create!(
      title: "#{title} - Assessment",
      content: "<p>This is a placeholder assessment for #{title}.</p>"
    )
  end
end

puts "Seeded 10 lessons: full content for the 10 lessons, placeholders for the rest."
