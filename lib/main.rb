require './answer'
require './question'
require './question'
require './survey'

@survey = Survey.instance
def question(text)
  @survey.add_question Question.new(text)
end

def answer_for_question(qid)
  a = @survey.results[qid]
  puts "ANSWER for Question #{qid} was #{a}"
end

def condition(qid, value)
@survey.last_question.add_condition(qid,value)
end

def conditions(hash)
  hash.keys.each{|k| @survey.last_question.add_condition(k,hash[k])}
end

def press(text)
 @survey.last_question.add_answer Answer.new(text,true)
end

def option(text)
  @survey.last_question.add_answer Answer.new(text,true)
end


load 'questions.qm'
@survey.next_question
@survey.next_question
@survey.next_question