module Resources
  def self.search_results(search)
    return Resource.all if search.blank?
    Resource.by_category(search)
  end

  def self.available_categories
    categories.map { |category| I18n.t("category_options.#{category}") }
  end

  private

  def self.categories
    [:impact, :ground, :protection]
  end
end