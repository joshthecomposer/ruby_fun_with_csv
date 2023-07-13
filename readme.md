# Ruby CSV Fun

*This console app was developed in* **Ruby 3.0.0**

## Goals/Thoughts/Struggles
I decided to take the challenge of doing this in Ruby, which I hadn't touched before this past weekend. I feel I have a much better grasp on Ruby syntax and I observed various similarities between Ruby and the other languages I know. The Enumerable helpers such as .map() and .select() were a welcome familiarity in particular. And the similarity to Python--my first language--was a welcome one.

Challenge 5 and 

## Instructions
1. [Go here](https://www.ruby-lang.org/en/documentation/installation/) and follow the instructions for installing Ruby on your system.
2. Clone this repo and cd into the root directory of the project.
3. In your console, type `ruby main.rb` to run the app.
4. Once the console app is started, follow the prompts to view my solutions.

# Documentation

## Challenges
In the console app, typing `1` then `return` will show the output of my solution for Challenge 1. The output should be:
```
================================================================================
Challenge 1: The 3 most commonly used languages with total number of parents: 
Hindi: 57
Urdu: 49
English: 47
================================================================================
Make another choice (1-7, b1, b2) or press x to quit...
```
Typing `2` then `return` will show challenge 2, etc.

You can choose as many challenges as you want before quitting the app by typing `x` then `return`.

## Dont forget the Bonuses!
In the console app, if you type `b1` or `b2` followed by `return` you will see the respective bonus solutions.

## Example Outputs
These are small snippets of what you can expect from each challenge, shortened for brevity.

Challenge 1:

    ================================================================================
    Challenge 1: The 3 most commonly used languages with total number of parents: 
    Hindi: 57
    Urdu: 49
    English: 47
    ================================================================================

Challenge 2: 

    ================================================================================
    Challenge 2: List of students with no cell phone number:
    student_id: 208, first_name: Barney, last_name: Nitzsche
    student_id: 220, first_name: Billy, last_name: Franecki
    student_id: 222, first_name: Demetrius, last_name: Barton
    ...
    ...

Challenge 3: 

    ================================================================================
    Challenge 3: List of students who are enrolled in Physics 9.
    student_id: 220, first_name: Billy, last_name: Franecki
    student_id: 222, first_name: Demetrius, last_name: Barton
    student_id: 225, first_name: Marielle, last_name: Pfannerstill
    ...
    ...

Challenge 4:

    ================================================================================
    Challenge 4: List of students with no parents listed or no contact info.
    student_id: 217, first_name: John, last_name: Beer
    student_id: 225, first_name: Marielle, last_name: Pfannerstill
    student_id: 233, first_name: Karoline, last_name: Robel
    student_id: 263, first_name: Loriann, last_name: Mueller

Challenge 5:

    ================================================================================
    Challenge 5: List of sections with no students enrolled.
    ================================================================================

Challenge 6: 

    ================================================================================
    Challenge 6: List of sections and students in each section.
    section_id: 150_25
    course_name: Physics 9

    student_ids: ["202", "207", "210", "212", ..., ...]

    --------------------------------------------------------------------------------
    section_id: 150_26
    course_name: Chemistry 9

    student_ids: ["200", "201", "208", "210", ..., ...]

    --------------------------------------------------------------------------------

Challenge 7:

    ================================================================================
    Challenge 7: List of staff members attached to a section.
    ================================================================================

Bonus 1:

    ================================================================================
    Challenge b1: Language mapping for language codes found in parents.csv
    Hindi: hi
    Spanish: es
    Urdu: ur
    English: en
    Portuguese: pt
    ================================================================================

Bonus 2: 

    ================================================================================
    Challenge b2: Phone numbers which appear in two or more files:
    Phone Number: 4223045198 Files: ["parents.csv", "staff.csv"]
    ================================================================================