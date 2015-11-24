module Questions
  def self.load_questions_list(type, next_type = nil)
    build_question_list_for(type, next_type)
  end

  private

  def self.fetch_file_values_for(value)
    path = "lib/inputs/#{value}/#{value}.json"
    file_read = File.read(path)
    @file = ActiveSupport::JSON.decode(file_read)["#{value}"]["questions_array"]

  def self.build_question_list_for(type, next_type)
    questions = build_questions_for(type)
    QuestionsList.new(type, questions, next_type)
  end

  def self.build_questions_for(type)
    fetch_file_values_for(type).map do |raw_question|
      Question.new(
        id: raw_question["id"],
        text: raw_question["text"],
        answers: build_answers(raw_question["answers_array"])
      )
    end
  end

  def self.build_answers(raw_answers)
    raw_answers.map do |raw_answer|
      AnswerView.new(
        id: raw_answer["id"],
        text: raw_answer["text"],
        final: raw_answer["final"],
        style_class: raw_answer["style_class"]
      )
    end
  end
end