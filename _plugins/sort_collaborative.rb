module Jekyll
  module SortCollaborativeFilter
    def sort_collaborative(items)
      now = Time.now
      now_key = now.year * 12 + now.month
      
      puts "######  sort_collaborative CALLED   #######"
      items.sort_by do |c|
        begin_key =
          (c["begin_year"].to_i * 12) + c["begin_month"].to_i

        end_key =
          if c["end_year"] && c["end_month"]
            (c["end_year"].to_i * 12) + c["end_month"].to_i
          else
            nil
          end

        # ongoing 判定：
        # - end_year が空
        # - または end が未来
        ongoing = end_key.nil? || end_key > now_key

        if ongoing
          # 1. ongoing が最優先
          # 2. 開始が遅いものが上
          [0, -begin_key]
        else
          # 1. finished は次
          # 2. 終了が新しいものが上
          # 3. 同月なら開始が遅いものが上
          [1, -end_key, -begin_key]
        end
      end
    end
  end
end


Liquid::Template.register_filter(Jekyll::SortCollaborativeFilter)
