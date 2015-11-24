module Questions
  class QuestionsList
    attr_reader :type, :questions, :next_list

    def initialize(type, questions, next_list)
      @type = type
      @questions = questions
      @next_list = next_list
    end
  end
end