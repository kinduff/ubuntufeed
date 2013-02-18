module FormaHelper
  def form_error model, field
    if model.errors[field].any?
      error = model.errors[field].first
     "<p class='error'>Error: #{error}</p>".html_safe
    end
  end
end
