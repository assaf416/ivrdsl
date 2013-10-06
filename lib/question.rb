require './survey'
class Question
  
  def initialize( text )
    @text = text
    @options = []
    @conditions = []
    @user_answer = -1
  end

  def check_conditions
    @survey = Survey.instance
    begin
      for condition in @conditions do 
        puts "QUESTION #{condition[0]} SHOULD BE #{condition[1]} and it is: #{@survey.answer(condition[0])} "
        return @survey.answer(condition[0]) == condition[1]
      end
    rescue Exception => e
      puts "SHEET => #{e.inspect}"
    end
  end
  
  def add_answer(answer)
    @options << answer
  end

  def add_condition(qid,value)
    @conditions << [qid,value]
  end
  
  
  def ask
    puts ""
    puts "Question: #{@text}"
    puts "Conditions: #{@conditions}"
    
    if check_conditions == false
      puts " PLEASE IGNORE THIS QUESTION "
      return -1
    end
    
    @options.size.times do |i|
      puts "#{i+1} - #{@options[i].text}"
    end
    print "Enter answer: "
    answer = gets.to_i 
    #    return @options[answer].correct
    @user_answer = answer
    return answer
  end
  
  
  def user_answer
    @user_answer
  end
end
