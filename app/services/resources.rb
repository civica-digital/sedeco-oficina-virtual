module Resources
  def self.available_categories
    categories.map { |category| I18n.t("category_options.#{category}") }
  end

  private

  def self.categories
    [:impact, :ground, :protection]
  end
end