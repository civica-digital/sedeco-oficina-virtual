module Questions
  class Question
    attr_reader :id, :text, :answers

    def initialize(id:, text:, question_type:, default_next:, constraints:, answers:)
      @id = id
      @text = text
      @selected_answer_value = nil
      @selected_answer_id = nil
      @question_type = question_type
      @default_next = default_next
      @constraints = constraints
      @answers = answers
    end

    def final?
      final
    end

    def next_question_id
      # constraints ej:  { 1: integer, 2: integer }
      constraints.fetch(answer_option, default_next)
    end
  end
end