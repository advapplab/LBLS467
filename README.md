# LBLS-469

## Data description
To support the development of advanced methodologies in emerging sciences, data collection is crucial. In the field of education, data is also essential for conceptual frameworks like Learning Analytics (LA) or Intelligent Tutoring Systems (ITS). Previous studies have shown the effectiveness of academic data, such as predicting at-risk students and revealing learning strategies. However, there was a lack of publicly available data sets for benchmarking these experiments. To contribute to educational research and development, we conducted a series of programming courses and collected learning data from 469 students. The data set includes two well-designed learning systems and measurements of two well-defined learning strategies: Self-regulated Learning (SRL) and Strategy Inventory for Language Learning (SILL). This study summarizes this data set as a Learning Behavior and Learning Strategies data set (LBLS-469), where 469 indicates the total number of students.

## Check List
| Class     | Participants | SRL Learning Motivation | SRL Learning Strategy | SILL | BookRoll | Viscode | Score |
| --------- | ------------ | ----------------------- | --------------------- | ---- | -------- | ------- | ----- |
| 1091-NCU  | 53           |                         |                       |      | V        | V       | V     |
| 1092-NCUA | 63           | V                       | V                     | V    | V        | V       | V     |
| 1092-NCUB | 56           | V                       | V                     | V    | V        | V       | V     |
| 1101-NCUA | 53           | V                       | V                     | V    | V        | V       | V     |
| 1101-NCUB | 50           | V                       | V                     | V    | V        | V       | V     |
| 1101-NTUT | 38           | V                       | V                     |      | V        | V       | V     |
| 1102-NCU  | 41           | V                       | V                     | V    | V        | V       | V     |
| 1111-NCU  | 56           | V                       | V                     |      | V        | V       | V     |
| 1111-NCCU | 59           |                         |                       |      | V        | V       | V     |
| Record    | 469          | 304                     | 294                   | 254  | 461      | 452     | 469   | 


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
## Students' BookRoll activities (learning behavior)
| Feature               | Description                                                                  |
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

For other feature details, please refer to : https://github.com/advapplab/LBLS160
