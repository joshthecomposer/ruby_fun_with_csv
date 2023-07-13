# Ruby CSV Fun

*This console app was developed in* **Ruby 3.0.0**

## Goals/Thoughts/Struggles
I decided to take the challenge of doing this in Ruby, which I hadn't touched before this past weekend. I feel I have a much better grasp on Ruby syntax and I observed various similarities between Ruby and the other languages I know. The Enumerable helpers such as .map() and .select() were a welcome familiarity in particular. And the similarity to Python--my first language--was a welcome one.

## Instructions
1. [Go here](https://www.ruby-lang.org/en/documentation/installation/) and follow the instructions for installing Ruby on your system.
2. Clone this repo and cd into the root directory of the project.
3. In your console, type `ruby main.rb` to run the app.
4. Once the console app is started, follow the prompts to view my solutions.

# Documentation

## Printing Challenges:
In the console app, typing `1` then `return` will show the output of my solution for Challenge 1.

**!!! The output will print to the console, but a JSON will also be generated into the outputs folder with the corresponding challenge name**

Typing `2` then `return` will show/generate challenge 2, etc.

You can choose as many challenges as you want before quitting the app by typing `x` then `return`.

## Printing Bonuses:
In the console app, if you type `b1` or `b2` followed by `return` you will see the respective bonus solutions.

## Example Outputs
These are small snippets of what you can expect from each challenge, shortened for brevity.

Challenge 1:

    ================================================================================
    Challenge 1: The 3 most commonly used languages with total number of parents: 
    [
        {
            "language": "Hindi",
            "parents": 57
        },
        {
            "language": "Urdu",
            "parents": 49
        },
        {
            "language": "English",
            "parents": 47
        }
    ]
    ================================================================================

Challenge 2: 

    ================================================================================
    Challenge 2: List of students with no cell phone number:
    [
        {
            "FirstName": "Barney",
            "LastName": "Nitzsche",
            "student_id": "208"
        },
        {
            "FirstName": "Billy",
            "LastName": "Franecki",
            "student_id": "220"
        },
        ...,
        ...
    ]

Challenge 3: 

    ================================================================================
    Challenge 3: List of students who are enrolled in Physics 9.
    [
        {
            "student_id": "220",
            "FirstName": "Billy",
            "LastName": "Franecki"
        },
        {
            "student_id": "222",
            "FirstName": "Demetrius",
            "LastName": "Barton"
        },
        ...,
        ...,
    ]

Challenge 4:

    ================================================================================
    Challenge 4: List of students with no parents listed or no contact info.
    [
        {
            "student_id": "217",
            "first_name": "John",
            "last_name": "Beer"
        },
        {
            "student_id": "225",
            "first_name": "Marielle",
            "last_name": "Pfannerstill"
        },
        ...,
        ...,
    ]

Challenge 5:

    [

    ]

Challenge 6: 

    ================================================================================
    Challenge 6: List of sections and students in each section.
    {
        "section_id": "150_45",
        "course_name": "Physics 1",
        "student_ids": [ 
            "204", 
            "206", 
            ..., 
            ...
        ]
    }
    --------------------------------------------------------------------------------
    section_id: 150_26
    course_name: Chemistry 9

    student_ids: ["200", "201", "208", "210", ..., ...]

    --------------------------------------------------------------------------------

Challenge 7:

    ================================================================================
    Challenge 7: List of staff members attached to a section.
    [

    ]
    ================================================================================

Bonus 1:

    ================================================================================
    Challenge b1: Language mapping for language codes found in parents.csv
    [
        {
            "language": "Hindi",
            "code": "hi"
        },
        {
            "language": "Spanish",
            "code": "es"
        },
        ...,
        ...,

    ]
    ================================================================================

Bonus 2: 

    ================================================================================
    Challenge b2: Phone numbers which appear in two or more files:
    [
        {
            "phone_number": "4223045198",
            "files": [
            "parents.csv",
            "staff.csv"
            ]
        }
    ]
    ================================================================================
