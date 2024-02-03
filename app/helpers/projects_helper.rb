module ProjectsHelper
  def display_number_of_feature_flags(project)
    n = project&.feature_flags&.count

    return "No feature flags" if n == nil || n == 0

    pluralize(n, "feature flag")
  end
end
