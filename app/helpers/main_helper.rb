module MainHelper
  def active?(page)
    current_page?(page) ? 'active' : ''
  end
end
