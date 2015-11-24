module Questions
  class AnswerView
    attr_reader :id, :text, :final, :style_class

    def initialize(id:, text:, final:, style_class:)
      @id = id
      @text = text
      @style_class = style_class
      @final = final
    end
  end
end