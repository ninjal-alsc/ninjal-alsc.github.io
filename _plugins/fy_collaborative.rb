require "date"

module Jekyll
  module FYCollaborativeFilter
    def collabs_in_fy(items, fy)
      puts "######  fy_collaborative CALLED   #######"
      fy = fy.to_i
      fy_begin = Date.new(fy, 4, 1)
      fy_end   = Date.new(fy + 1, 3, 31)

      items.select do |c|
        # begin
        next false unless c["begin_year"] && c["begin_month"]
        cb = Date.new(c["begin_year"].to_i, c["begin_month"].to_i, 1)

        # end（未指定は十分未来）
        if c["end_year"] && c["end_month"]
          ey = c["end_year"].to_i
          em = c["end_month"].to_i

          # ★ ここが重要：3月終了はそのFYに含めない
          if em >= 4
            ce = Date.new(ey, em, 1)
          else
            # 1–3月終了 → 前年度の3月で打ち切り
            ce = Date.new(ey - 1, 3, 31)
          end
        else
          ce = Date.new(9999, 12, 31)
        end

        ce >= fy_begin && cb <= fy_end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::FYCollaborativeFilter)
