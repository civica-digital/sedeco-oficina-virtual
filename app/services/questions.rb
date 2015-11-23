module Questions
  def self.load_questions_list(type, next_type = nil)
    build_question_list_for(type, next_type)
  end

  private

  def self.fetch_file_values_for(value)
    path = "lib/inputs/#{value}/#{value}.json"
    file_read = File.read(path)
    @file = ActiveSupport::JSON.decode(file_read)["#{value}"]["question_array"]

  def self.build_question_list_for(type, next_type)
    questions = build_questions_for(type)
    QuestionsList.new(type, questions, next_type)
  end

  def self.build_questions_for(type)
    fetch_file_values_for(type).map do |raw_question|
      Question.new(
        id: raw_question["id"],
        text: raw_question["text"],
        answers: build_answers(raw_question["answer_array"])
      )
    end
  end

  def self.build_answers(raw_answers)
    raw_answers.map do |raw_answer|
      AnswerView.new(
        id: raw_answer["id"],
        text: raw_answer["text"],
        style_class: raw_answer["style_class"]
      )
    end
  end

  class QuestionsList
    attr_reader :type, :questions, :next_list

    def initialize(type, questions, next_list)
      @type = type
      @questions = questions
      @next_list = next_list
    end
  end

  class Question
    attr_reader :id, :text, :answers

    def initialize(id:, text:, default_next:, answers:)
      @id = id
      @text = text
      #@answer_value = answer_value
      #@answer_option = answer_option
      #@answer_type = answer_type
      #@default_next = default_next
      #@constraints = constraints
      #@final = final
      #@answers = answers
    end

    def final?
      #final
    end

    def next_question_id
      # constraints ej:  { 1: integer, 2: integer }
      #constraints.fetch(answer_option, default_next)
    end
  end

  class AnswerView
    attr_reader :id, :text, :style_class

    def initialize(id:, text:, style_class:)
      @id = id
      @text = text
      @style_class = :style_class
    end
  end
end