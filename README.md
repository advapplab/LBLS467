# LBLS467

## Data description
To support the development of advanced methodologies in emerging sciences, data collection is crucial. In the field of education, data is also essential for conceptual frameworks like Learning Analytics (LA) or Intelligent Tutoring Systems (ITS). Previous studies have shown the effectiveness of academic data, such as predicting at-risk students and revealing learning strategies. However, there was a lack of publicly available data sets for benchmarking these experiments. To contribute to educational research and development, we conducted a series of programming courses and collected learning data from 467 students. The data set includes two well-designed learning systems and measurements of two well-defined learning strategies: Self-regulated Learning (SRL) and Strategy Inventory for Language Learning (SILL). This study summarizes this data set as a Learning Behavior and Learning Strategies data set (LBLS467), where 467 indicates the total number of students.

## Check List
| Class     | Participants | SRL Learning Motivation | SRL Learning Strategy | SILL | BookRoll | Viscode | Score |
| --------- | ------------ | ----------------------- | --------------------- | ---- | -------- | ------- | ----- |
| 1091-NCU  | 53           |                         |                       |      | V        | V       | V     |
| 1092-NCUA | 63           | V                       | V                     | V    | V        | V       | V     |
| 1092-NCUB | 56           | V                       | V                     | V    | V        | V       | V     |
| 1101-NCUA | 51           | V                       | V                     | V    | V        | V       | V     |
| 1101-NCUB | 50           | V                       | V                     | V    | V        | V       | V     |
| 1101-NTUT | 38           | V                       | V                     |      | V        | V       | V     |
| 1102-NCU  | 41           | V                       | V                     | V    | V        | V       | V     |
| 1111-NCU  | 56           | V                       | V                     |      | V        | V       | V     |
| 1111-NCCU | 59           |                         |                       |      | V        | V       | V     |
| Record    | 467          | 304                     | 294                   | 254  | 461      | 452     | 467   | 


### Complete LOG and questionnaire data: 200 records

## Folder Structure
    .
    ├── ...
    ├── data                    
    │   ├── br.csv              # Students' BookRoll activities (learning behavior)
    │   ├── score.csv           # Students' final score
    │   ├── sill.csv            # Students' Strategy Inventory for Language Learning (SILL) measurement results
    │   ├── srl_motivation.csv  # Students' Self-regulated Learning (SRL) measurement results Learning Motivation
    |   ├── srl_strategy.csv    # Students' Self-regulated Learning (SRL) measurement results Learning Strategy
    │   ├── viscode.csv         # Students' VisCode activities (learning behavior)    

# Data Formats

## Students' final score
| Feature  | Description                                                                               |
| -------- | ------------------------------------------------------------------------------------------|
| userid   | Anonymized student userid, eg: b1dfc5c6ec04d46d1823c5fa972ad320                           |
| score	   | Students' final score, less than 60 indicated failed on this course.                      |
| class	   | Students' class identity.                                                                 |

![score](https://user-images.githubusercontent.com/61023223/230403773-f9ee5181-4303-4f55-b2a2-3f5e6716ed72.png)

## Students' BookRoll activities (learning behavior)
| Feature               | Description                                                                  |
| -------- | ------------------------------------------------------------------------------------------|
| userid                | Anonymized student userid, eg: b1dfc5c6ec04d46d1823c5fa972ad320              | 
| ADD BOOKMARK	        | Added a bookmark to current page.                                            | 
| ADD MARKER	        | Added a marker to current page.                                              | 
| ADD MEMO	            | Added a memo to current page.                                                | 
| ADD_HW_MEMO	        | Added a handwrite memo to current page.                                      | 
| BOOKMARK_JUMP	        | Jump to a specific page with a bookmark.                                     | 
| CHANGE MEMO	        | Modify the content of an existing memo on current page.                      | 
| CLEAR_HW_MEMO         | Clear the content of an existing handwrite memo on current page.             | 
| CLOSE	                | Closed the book.                                                             | 
| CLOSE_RECOMMENDATION	| Deleted an exist bookmark in the e-book.                                     | 
| DELETE BOOKMARK	    | Deleted a bookmark on current page.                                          | 
| DELETE MARKER	        | Deleted a marker on current page.                                            | 
| DELETE_MEMO	        | Deleted a memo on current page.                                              | 
| GETIT	                | Press the smiley face icon to indicate the understanding on current page.    | 
| MEMO_JUMP	            | Select a note to jump to the specific page.                                  | 
| NEXT	                | Went to the next page.                                                       | 
| NOTGETIT	            | Press the crying face icon to indicate the misunderstanding on current page. | 
| OPEN	                | Opened the book.                                                             | 
| OPEN_RECOMMENDATION   | 	                                                                           | 
| PAGE_JUMP	            | Jumped to a particular page.                                                 | 
| PREV	                | Went to the previous page.                                                   | 
| REGIST CONTENTS	    |                                                                              | 
| SEARCH	            | Searched for something within the e-book.                                    | 
| SEARCH_JUMP	        | Jumped to a page from the search results.                                    | 
| UNDO_HW_MEMO	        | Undo the last action of handwriting.                                         | 


![BookRoll_Features_Distribution](https://user-images.githubusercontent.com/61023223/230416889-7adeb8f2-db00-417c-ba3b-a6be1bd51e40.png)

## Students' VisCode activities (learning behavior)
| Feature               | Description                                                                                                     |        
| --------------------- | --------------------------------------------------------------------------------------------------------------- |
| userid	            | Anonymized student userid, eg: b1dfc5c6ec04d46d1823c5fa972ad320                                                 | 
| code_length	        | Nunber of lines of code (LOC) coded in this semester.                                                           | 
| code_copy	            | Number of times a student copy codes.                                                                           | 
| code_execution	    | Number of times a student execute codes.                                                                        | 
| code_paste	        | Number of times a student paste codes.                                                                          | 
| code_speed	        | Average input digits per minutes.                                                                               | 
| notebook_open	        | Number of times a student open coding environment.                                                              |
| tree_open	            | Number of times a student open a foder looking for a code.                                                      |
| AssertionError        | Raised when the assert statement fails.                                                                         |
| AttributeError	    | Raised when attribute reference or assignment fails.                                                            |
| AxisError             | Axis supplied was invalid.                                                                                      |
| ConversionError	    | Failed to convert value(s) to axis units.                                                                       |
| DataError             | This exception is raised when there were problems with the data.                                                |
| EmptyDataError        | Exception raised in pd.read_csv when empty data or header is encountered.                                       |
| Exception             | Occurs during the execution of a program that disrupts the normal flow of the program's instructions.           |
| FileExistsError	    | Raised when trying to create a file or directory which already exists.                                          | 
| FileNotFoundError	    | Raised when a file or directory is requested but doesn’t exist.                                                 | 
| HTTPError             | An HTTPError is raised when an HTTP request returns a status code that represents an error, such as 4xx or 5xx. |
| ImportError           | Raised when the imported module is not found.                                                                   |
| IndentationError	    | Base class for syntax errors related to incorrect indentation.                                                  | 
| IndexError	        | Raised when a sequence subscript is out of range.                                                               | 
| IndexingError         | Exception is raised when trying to index and there is a mismatch in dimensions.                                 |
| InvalidURL            | URL has an invalid label for the URL which has underscored in it.                                               |
| JSONDecodeError	    | Raised if the given JSON document is not valid.                                                                 | 
| KeyError	            | Raised when a mapping (dictionary) key is not found in the set of existing keys.                                | 
| KeyboardInterrupt	    | Raised when the user hits the interrupt key (normally Control-C or Delete).                                     | 
| LookupError	        | The base class for the exceptions that are raised when a key or index used on a mapping or sequence is invalid: IndexError, KeyError.  |
| ModuleNotFoundError   | A subclass of ImportError which is raised by import when a module could not be located.                         |
| NameError	            | Raised when a local or global name is not found.                                                                | 
| OperationalError      | Exception raised for errors that are related to the database’s operation, and not necessarily under the control of the programmer.     |
| OSError               | Raised when a system operation causes a system-related error.                                                   |
| OverflowError         | Raised when the result of an arithmetic operation is too large to be represented.                               |
| ParserError           | Exception that is raised by an error encountered in parsing file contents.                                      |
| RecursionError        | An exception that occurs when the maximum recursion depth is exceeded.                                          |
| RuntimeError          | Raised when an error does not fall under any other category.                                                    |
| SelectorSyntaxError   | Parsing a selector that does not match the grammar.                                                             |
| SpecificationError    | Exception raised by agg when the functions are ill-specified.                                                   |
| StopIteration         | Raised by the next() function to indicate that there is no further item to be returned by the iterator.         |
| SyntaxError	        | Raised when the parser encounters a syntax error.                                                               | 
| TabError	            | Raised when indentation contains an inconsistent use of tabs and spaces.                                        | 
| TclError              | Trying to access widgets while there's none                                                                     |
| TypeError             | Raised when an operation or function is applied to an object of inappropriate type.                             | 
| UFuncTypeError        | A datatype mismatch in string concatenation in np.load(...)                                                     |
| UndefinedVariableError| Exception raised by query or eval when using an undefined variable name.                                        |
| UnboundLocalError	    | Raised when a reference is made to a local variable in a function or method, but no value has been bound to that variable.             |
| UnicodeDecodeError    | Raised when a Unicode-related error occurs during decoding.                                                     | 
| ValueError	        | Raised when an operation or function receives an argument that has the right type but an inappropriate value, and the situation is not described by a more precise exception such as IndexError. |
| WebDriverException    | Occurs if the given session id is not in the list of active sessions                                            |
| XLRDError             | Not supported xlsx file                                                                                         |
| ZeroDivisionError	    | Raised when the second argument of a division or modulo operation is zero.                                      |


![VisCode_Features_Distribution](https://user-images.githubusercontent.com/61023223/230416931-0472743c-c37c-4180-ba19-588ecbbdbe6a.png)

## Students' Strategy Inventory for Language Learning (SILL) measurement results
| Feature               | Description                                                                                                     |        
| --------------------- | --------------------------------------------------------------------------------------------------------------- |
| userid	            | Anonymized student userid, eg: b1dfc5c6ec04d46d1823c5fa972ad320.                                                |
| s_1	(Memory)        | I think of relationships between what I already know and new things I learn in programming language.            |
| s_2	(Memory)        | I use Syntax or Lexical which just learned in my code, so I can remember them.                                  | 
| s_3	(Memory)        |  I connect the diagram or logic of a new programming skill to help remember them.                               |
| s_4	(Memory)        | I remember a new Syntax or Lexical by making a diagram which the function might be used.                        |
| s_5	(Memory)        | I use textbooks or dictionary to remember Syntax or Lexical which I just learned.                               |
| s_6	(Memory)        | I physically implement a function by Syntax or Lexical which I just learned.                                    |
| s_7	(Memory)        | I review code often.                                                                                            |
| s_8	(Memory)        | I remember new Syntax or Lexical by remembering their location on the page.                                     |
| s_9	(Cogntive)      | I practice coding often.                                                                                        |
| s_10	(Cogntive)      | I try to code like an open-source contributor.                                                                  |
| s_11	(Cogntive)      | I pratice to design code structure.                                                                             |
| s_12	(Cogntive)      | I implement a founction in different code structure.                                                            |
| s_13	(Cogntive)      | I refer example code in open-source community.                                                                  |
| s_14	(Cogntive)      | I code for pleasure.                                                                                            |
| s_15	(Cogntive)      | I code for solving the problems encountered in life.                                                            |
| s_16	(Cogntive)      | I first skim code structure (function name, variable name, calls) then go back to simulate execution carefully. |
| s_17	(Cogntive)      | I run units to understand a complex code or new Syntax or Lexical.                                              |
| s_18	(Cogntive)      | I try to find patterns in code.                                                                                 |
| s_19	(Cogntive)      | I find the meaning of a code by dividing it into units.                                                         |
| s_20	(Cogntive)      | I try not to avoid to read comments in code.                                                                    |
| s_21	(Cogntive)      | I make summaries, notes when I interpret code.                                                                  |
| s_22	(Compensation)  | To understand unfamiliar Syntax or Lexical, I make guesses.                                                     |
| s_23	(Compensation)  | I use other functions or methods when I forget the direct one.                                                  |
| s_24	(Compensation)  | I make up new functions if I do not know the right ones.                                                        |
| s_25	(Compensation)  | I can read a code without using textbooks or dictionary.                                                        |
| s_26	(Compensation)  | I try to guess what the meaning of unfamiliar Syntax or Lexical.                                                |
| s_27	(Compensation)  | If I can' t think of a Method or Class, I implement one instead.                                                |
| s_28	(Metacognitive) | I try to guess what the other person will design in assignment.                                                 |
| s_29	(Metacognitive) | I notice my weakness of programming skills and use that information to help me do better.                       |
| s_30	(Metacognitive) | I pay attention when someone is explaining a concept on programming.                                            |
| s_31	(Metacognitive) | I try to fine out how to be a better programmer.                                                                |
| s_32	(Metacognitive) | I plan my schedule so I will have enough time to study programming.                                             |
| s_33	(Metacognitive) | I look for people I can talk to in programming.                                                                 |
| s_34	(Metacognitive) | I look for opportunities to read as much as possible in codes.                                                  |
| s_35	(Metacognitive) | I have clear goals for improving my programming skills.                                                         |
| s_36	(Metacognitive) | I think about my progress in learning programming.                                                              |
| s_37	(Affective)     |  I try to relax whenever I feel afraid of coding.                                                               |
| s_38	(Affective)     | I encourage myself to code even when I am afraid of making a mistake.                                           |
| s_39	(Affective)     | I give myself a reward or treat when I do well in programming assignment.                                       |
| s_40	(Affective)     | I notice if I am tense or nervous when I am coding a programming.                                               |
| s_41	(Affective)     | I write down my feelings in a language learning diary.                                                          |
| s_42	(Affective)     | I talk to someone else about how I feel when I am learning programming.                                         |
| s_43	(Social)        | If I do not understand something in programming, I ask question in opensource communities.                      |
| s_44	(Social)        | I ask contributers in opensource communities to review my code.                                                 |
| s_45	(Social)        | I join opensource communities.                                                                                  |
| s_46	(Social)        | I ask for help from opensource communities.                                                                     |
| s_47	(Social)        | I ask questions.                                                                                                |
| s_48	(Social)        | I try to kearn about the style of coding.                                                                       |


![sill](https://user-images.githubusercontent.com/61023223/230417483-468e2609-4545-4141-8021-e8292aafd5c6.png)

# Students' Self-regulated Learning (SRL) measurement results
## SRL Strategy
| Feature  | Description                                                                                                     |
| -------- | --------------------------------------------------------------------------------------------------------------- |
| userid   | Anonymized student userid, eg: b1dfc5c6ec04d46d1823c5fa972ad320.                                                |
| srl_s_1  | (Rehearsal) When I study for this class, I practice saying the material to myself over and over. |
| srl_s_2  | (Rehearsal) When studying for this class, I read my class notes and the course readings over and over again. |
| srl_s_3  | (Rehearsal) I memorize key words to remind me of important concepts in this class. |
| srl_s_4  | (Rehearsal) I make lists of important terms for this course and memorize the lists.|
| srl_s_5  | (Elaboration) When I study for this class, I pull together information from different sources, such as lectures, readings, and discussions. |
| srl_s_6  | (Elaboration) I try to relate ideas in this subject to those in other courses whenever possible. |
| srl_s_7  | (Elaboration) When reading for this class, I try to relate the material to what I already know. |
| srl_s_8  | (Elaboration) When I study for this course, I write brief summaries of the main ideas from the readings and the concepts from the lectures. |
| srl_s_9 | (Elaboration) I try to understand the material in this class by making connections between the readings and the concepts from the lectures. |
| srl_s_10  | (Elaboration) I try to apply ideas from course readings in other class activities such as lecture and discussion.|
| srl_s_11 | (Organization) When I study the readings for this course, I outline the material to help me organize my thoughts. |
| srl_s_12 | (Organization) When I study for this course, I go through the readings and my class notes and try to find the most important ideas. |
| srl_s_13 | (Organization) I make simple charts, diagrams, or tables to help me organize course material. |
| srl_s_14 | (Organization) When I study for this course, I go over my class notes and make an outline of important concepts. |
| srl_s_15 | (Critical Thinking) I often find myself questioning things I hear or read in this course to decide if I find them convincing. |
| srl_s_16 | (Critical Thinking) When a theory, interpretation, or conclusion is presented in class or in the readings, I try to decide if there is good supporting evidence.  |
| srl_s_17 | (Critical Thinking) I treat the course material as a starting point and try to develop my own ideas about it. |
| srl_s_18 | (Critical Thinking) I try to play around with ideas of my own related to what I am learning in this course. |
| srl_s_19 | (Critical Thinking) Whenever I read or hear an assertion or conclusion in this class, I think about possible alternatives. |
| srl_s_20 | (Metacognitive Self-Regulation) During class time I often miss important points because I'm thinking of other things. (REVERSED) |
| srl_s_21 | (Metacognitive Self-Regulation) When reading for this course, I make up questions to help focus my reading.  |
| srl_s_22 | (Metacognitive Self-Regulation) When I become confused about something I'm reading for this class, I go back and try to figure it out. |
| srl_s_23 | (Metacognitive Self-Regulation) If course materials are difficult to understand, I change the way I read the material. |
| srl_s_24 | (Metacognitive Self-Regulation) Before I study new course material thoroughly, I often skim it to see how it is organized. |
| srl_s_25 | (Metacognitive Self-Regulation) I ask myself questions to make sure I understand the material I have been studying in this class. |
| srl_s_26 | (Metacognitive Self-Regulation) I try to change the way I study in order to fit the course requirements and instructor's teaching style. |
| srl_s_27 | (Metacognitive Self-Regulation) I often find that I have been reading for class but don't know what it was all about. (REVERSED) |
| srl_s_28 | (Metacognitive Self-Regulation) I try to think through a topic and decide what I am supposed to learn from it rather than just reading it over when studying. |
| srl_s_29 | (Metacognitive Self-Regulation) When studying for this course I try to determine which concepts I don't understand well. |
| srl_s_30 | (Metacognitive Self-Regulation) When I study for this class, I set goals for myself in order to direct my activities in each study period. |
| srl_s_31 | (Metacognitive Self-Regulation) If I get confused taking notes in class, I make sure I sort it out afterwards. |
| srl_s_32 | (Metacognitive Self-Regulation) I usually study in a place where I can concentrate on my course work. |
| srl_s_33 | (Metacognitive Self-Regulation) I make good use of my study time for this course. |
| srl_s_34 | (Metacognitive Self-Regulation) I find it hard to stick to a study schedule. (REVERSED) |
| srl_s_35 | (Metacognitive Self-Regulation) I have a regular place set aside for studying. |
| srl_s_36 | (Metacognitive Self-Regulation) I make sure I keep up with the weekly readings and assignments for this course. |
| srl_s_37 | (Metacognitive Self-Regulation) I attend class regularly. |
| srl_s_38 | (Metacognitive Self-Regulation) I often find that I don't spend very much time on this course because of other activities. (REVERSED) |
| srl_s_39 | (Metacognitive Self-Regulation) I rarely find time to review my notes or readings before an exam. (REVERSED) |
| srl_s_40 | (Effort Regulation) I often feel so lazy or bored when I study for this class that I quit before I finish what I planned to do. (REVERSED) |
| srl_s_41 | (Effort Regulation) I work hard to do well in this class even if I don't like what we are doing. |
| srl_s_42 | (Effort Regulation) When course work is difficult, I give up or only study the easy parts. (REVERSED) |
| srl_s_43 | (Effort Regulation) Even when course materials are dull and uninteresting, I manage to keep working until I finish. |
| srl_s_44 | (Peer Learning) When studying for this course, I often try to explain the material to a classmate or a friend. |
| srl_s_45 | (Peer Learning) I try to work with other students from this class to complete the course assignments. |
| srl_s_46 | (Peer Learning) | When studying for this course, I often set aside time to discuss the course material with a group of students from the class. |
| srl_s_47 | (Help Seeking) Even if I have trouble learning the material in this class, I try to do the work on my own, without help from anyone. (REVERSED) |
| srl_s_48 | (Help Seeking) I ask the instructor to clarify concepts I don't understand well. |
| srl_s_49 | (Help Seeking) When I can't understand the material in this course, I ask another student in this class for help. |
| srl_s_50 | (Help Seeking) I try to identify students in this class whom I can ask for help if necessary. |


![srl_strategy](https://user-images.githubusercontent.com/61023223/230419150-923ae086-32ed-46b2-8a0c-8b9e5d087db7.png)



## SRL Motivation
| Feature  | Description                                                                                                     |
| -------- | --------------------------------------------------------------------------------------------------------------- |
| userid   | Anonymized student userid, eg: b1dfc5c6ec04d46d1823c5fa972ad320.                                                |
| srl_m_1  | (Intrinsic) In a class like this, I prefer course material that really challenges me so I can learn new things. |
| srl_m_2  | (Intrinsic) In a class like this, I prefer course material that arouses my curiosity, even if it is difficult to learn. |
| srl_m_3  | (Intrinsic) The most satisfying thing for me in this course is trying to understand the content as thoroughly as possible. |
| srl_m_4  | (Intrinsic) When I have the opportunity in this class, I choose course assignments that I can learn from even if they don't guarantee a good grade. |
| srl_m_5  | (Extrinsic) Getting a good grade in this class is the most satisfying thing for me right now. |
| srl_m_6  | (Extrinsic) The most important thing for me right now is improving my overall grade point average, so my main concern in this class is getting a good grade.|
| srl_m_7  | (Extrinsic) If I can, I want to get better grades in this class than most of the other students. |
| srl_m_8  | (Extrinsic) I want to do well in this class because it is important to show my ability to my family, friends, employer, or others. |
| srl_m_9  | (Task Value) I think I will be able to use what I learn in this course in other courses. |
| srl_m_10 | (Task Value) It is important for me to learn the course material in this class. |
| srl_m_11 | (Task Value) I am very interested in the content area of this course. |
| srl_m_12 | (Task Value) I think the course material in this class is useful for me to learn. |
| srl_m_13 | (Task Value) I like the subject matter of this course. |
| srl_m_14 | (Task Value) Understanding the subject matter of this course is very important to me. |
| srl_m_15 | (Control Beliefs) If I study in appropriate ways, then I will be able to learn the material in this course. |
| srl_m_16 | (Control Beliefs) It is my own fault if I don't learn the material in this course. |
| srl_m_17 | (Control Beliefs) If I try hard enough, then I will understand the course material. |
| srl_m_18 | (Control Beliefs) If I don't understand the course material, it is because I didn't try hard enough. |
| srl_m_19 | (Self-Efficacy) I believe I will receive an excellent grade in this class. |
| srl_m_20 | (Self-Efficacy) I'm certain I can understand the most difficult material presented in the readings for this course. |
| srl_m_21 | (Self-Efficacy) I'm confident I can understand the basic concepts taught in this course. |
| srl_m_22 | (Self-Efficacy) I'm confident I can understand the most complex material presented by the instructor in this course. |
| srl_m_23 | (Self-Efficacy) I'm confident I can do an excellent job on the assignments and tests in this course. |
| srl_m_24 | (Self-Efficacy) I expect to do well in this class. |
| srl_m_25 | (Self-Efficacy) I'm certain I can master the skills being taught in this class. |
| srl_m_26 | (Self-Efficacy) Considering the difficulty of this course, the teacher, and my skills, I think I will do well in this class. |
| srl_m_27 | (Test Anxiety) When I take a test I think about how poorly I am doing compared with other students. |
| srl_m_28 | (Test Anxiety) When I take a test I think about items on other parts of the test I can't answer. |
| srl_m_29 | (Test Anxiety) When I take tests I think of the consequences of failing. |
| srl_m_30 | (Test Anxiety) I have an uneasy, upset feeling when I take an exam. |
| srl_m_31 | (Test Anxiety) I feel my heart beating fast when I take an exam. |

![srl_motivation](https://user-images.githubusercontent.com/61023223/230417540-7a7be7e5-e6b8-4e67-baae-07f92d2d089e.png)

## ALL Questionario
![all_questionario](https://user-images.githubusercontent.com/61023223/230403852-7e09365b-d015-48d5-821a-845259369831.png)
For other feature details, please refer to : https://github.com/advapplab/LBLS160


## Correlation
![BookRoll_Correlation](https://user-images.githubusercontent.com/61023223/230403907-71348f74-d4b1-43c2-9eb9-29b8e1719514.png)
![VisCode_Correlation](https://user-images.githubusercontent.com/61023223/230403925-70bb9b1f-f542-4853-802d-12faa5ffc9ec.png)
![Questionario_Correlation](https://user-images.githubusercontent.com/61023223/230403879-fd1c5e6f-4b8b-45c8-8be8-9d0949c1f06e.png)

