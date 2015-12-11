module Resources
  def self.search_results(search)
    return Resource.all if search.blank? || (search == I18n.t("category_options.all"))
    Resource.by_category(search)
  end

  def self.available_categories
    categories.map { |category| I18n.t("category_options.#{category}") }
  end

  private

  def self.categories
    [:impact, :ground, :protection, :all]
  end
end