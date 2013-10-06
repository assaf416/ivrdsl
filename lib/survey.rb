require 'singleton'

class Survey
  include Singleton

  def initialize
    @questions = []
    @results = []
  end
  
  
  def answer_for_question(qid)
    a = self.results[qid]
    puts "ANSWER for Question #{qid} was #{a}"
  end
  
  def question(num)
    @questions[num]
  end
  
  
  def add_question(question)
    @questions << question
  end

  def last_question
    @questions.last
  end

  def next_question
    if @current_question.nil?
      @current_question = 0 
    else
      @current_question =  @current_question + 1
    end
    
    begin
      @results << @questions[@current_question].ask
      puts "RESULTS: #{@results.to_s}"
    rescue Exception => e
      puts "Sorry no more questions #{e.message}"
    end
    
  end
  
  
  def run_survey
    @questions.each { |q| @results <<  q.ask }
    puts " Here are your answers of #{@questions.size}."
    puts @results.to_s
  end
  
  
  def answer(i)
    @results[i].to_i
  end
  
  def results
    @results
  end
end