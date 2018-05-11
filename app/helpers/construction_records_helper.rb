# frozen_string_literal: true

# Helper / View object class for public flow of construction records.
module ConstructionRecordsHelper

  def construction_index_path(year)
    date = Date.new(year, 7, 1)
    japanese_date = JapaneseDate.from_western(date)
    link_to "#{japanese_date.year}年度",
            construction_records_path(year: year),
            class: "nav-link #{'active' if params[:year] == year.to_s}"
  end

  def construction_category_title(category)
    case category
    when 'civil' then '土木の部'
    when 'architecture' then '建築の部'
    when 'joint' then '相生の部'
    end
  end
end
