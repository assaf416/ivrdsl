class Answer
  attr_reader :text, :correct
  def initialize( text, correct )
    @text = text
    @correct = correct
  end
end
