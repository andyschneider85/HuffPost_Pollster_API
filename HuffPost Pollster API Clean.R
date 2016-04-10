
"""
The following code uses the pollstR package to acquire polling data from the Huffpost Pollster API.
It then cleans it into tidy dataframes containing General Election polls for Clinton vs. Cruz/Trump/Kasich for 9 swing states.
"""

library(pollstR)
library(sqldf)

# Write function that retrieves HuffPost polling data for a given state

get_state <- function(x) {
  pollstr_polls(page = 1, chart = NULL, state = x, topic = NULL,
                before = NULL, after = '2015-01-01', sort = FALSE, showall = NULL,
                max_pages = 5000, convert = TRUE)
}

# Use function to retrive data for selected swing states

ohio <- get_state('OH')
florida <- get_state('FL')
virginia <- get_state('VA')
pennsylvania <- get_state('PA')
north_carolina <- get_state('NC')
nevada <- get_state('NV')
colorado <- get_state('CO')
wisonsin <- get_state('WI')
iowa <- get_state('IA')

# Create distinct dataframes for polling information and question information for each swing state

ohio_polling <- as.data.frame(ohio["polls"])
ohio_questions <- as.data.frame(ohio["questions"])

florida_polling <- as.data.frame(florida["polls"])
florida_questions <- as.data.frame(florida["questions"])

virginia_polling <- as.data.frame(virginia["polls"])
virginia_questions <- as.data.frame(virginia["questions"])

pennsylvania_polling <- as.data.frame(pennsylvania["polls"])
pennsylvania_questions <- as.data.frame(pennsylvania["questions"])

north_carolina_polling <- as.data.frame(north_carolina["polls"])
north_carolina_questions <- as.data.frame(north_carolina["questions"])

nevada_polling <- as.data.frame(nevada["polls"])
nevada_questions <- as.data.frame(nevada["questions"])

colorado_polling <- as.data.frame(colorado["polls"])
colorado_questions <- as.data.frame(colorado["questions"])

wisconsin_polling <- as.data.frame(wisconsin["polls"])
wisconsin_questions <- as.data.frame(wisconsin["questions"])

iowa_polling <- as.data.frame(iowa["polls"])
iowa_questions <- as.data.frame(iowa["questions"])

# Create tidy dataframes for General Election polls since 1/1/15 for Clinton vs. Cruz/Trump/Kasich that show results, polling source, and polling date

ohio_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
              from ohio_questions, ohio_polling
              where "questions.question" = "2016 Ohio Presidential GE"
              AND "questions.id" = "polls.id"
              ')

florida_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
                 from florida_questions, florida_polling
                 where "questions.question" = "2016 Florida Presidential GE"
                 AND "questions.id" = "polls.id"
                 ')

virginia_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
                 from virginia_questions, virginia_polling
                 where "questions.question" = "2016 Virginia Presidential GE"
                 AND "questions.id" = "polls.id"
                 ')

pennsylvania_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
              from pennsylvania_questions, pennsylvania_polling
              where "questions.question" = "2016 Pennsylvania Presidential GE"
              AND "questions.id" = "polls.id"
              ')

north_carolina_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
                 from north_carolina_questions, north_carolina_polling
                 where "questions.question" = "2016 North Carolina Presidential GE"
                 AND "questions.id" = "polls.id"
                 ')

nevada_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
                 from nevada_questions, nevada_polling
                 where "questions.question" = "2016 Nevada Presidential GE"
                 AND "questions.id" = "polls.id"
                 ')

colorado_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
                 from colorado_questions, colorado_polling
                 where "questions.question" = "2016 Colorado Presidential GE"
                 AND "questions.id" = "polls.id"
                 ')

wisconsin_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
                 from wisconsin_questions, wisconsin_polling
                 where "questions.question" = "2016 Wisconsin Presidential GE"
                 AND "questions.id" = "polls.id"
                 ')

iowa_GE <- sqldf('select "questions.question", "questions.choice", "questions.value", "polls.pollster", "polls.end_date"
              from iowa_questions, iowa_polling
              where "questions.question" = "2016 Iowa Presidential GE"
              AND "questions.id" = "polls.id"
              ')

# List clean general election polling dataframes

ohio_GE
florida_GE
virginia_GE
pennsylvania_GE
north_carolina_GE
nevada_GE
colorado_GE
wisconsin_GE
iowa_GE

