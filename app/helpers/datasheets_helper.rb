module DatasheetsHelper
  # Sorting the table - sort_column and sort_direction defined in controller - private
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, :sort => column, :direction => direction
  end
end
