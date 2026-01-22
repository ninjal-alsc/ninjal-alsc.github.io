---
title: "研究業績 / Publications"
permalink: /publications/
layout: single
classes: wide
author_profile: false
read_time: false
show_date: true
header:
    show_overlay_excerpt: false
    show_date: true 
    overlay_color: default
---
<!-- ベースCSS -->
<style>
.all-section { display:block; }
.fy-section  { display:none; }

#fyall:checked ~ .all-section { display:block; }

input[id^="fy"]:not(#fyall):checked ~ .all-section {
  display:none;
}

/* ラジオボタン非表示 */
.publications input[type="radio"] {
  position: absolute;
  opacity: 0;
}

/* タブラベル */
.publications label {
  cursor: pointer;
  padding: 4px 8px;
}

/* 選択中の年を強調 */
#fyall:checked + label,
input[id^="fy"]:checked + label {
  font-weight: bold;
  border-bottom: 2px solid currentColor;
}

.publications label {
  display: inline-block;
  margin-right: 12px;
  cursor: pointer;
  padding: 4px 8px;
}
</style>

<!-- 有効年度をリストアップ -->
{% assign pubs = site.publications_books
  | concat: site.publications_papers
  | concat: site.publications_awards
  | sort: "year"
  | reverse
%}

<!-- Books, Papers, Awards 分 -->
{% assign fys = "" | split: "" %}
{% for p in pubs %}
  {% assign y = p.year | plus: 0 %}
  {% assign m = p.month | plus: 0 %}
  {% if m >= 4 %}
    {% assign fy = y %}
  {% else %}
    {% assign fy = y | minus: 1 %}
  {% endif %}
  {% unless fys contains fy %}
    {% assign fys = fys | push: fy %}
  {% endunless %}
{% endfor %}


<!-- Collaborative Research 分（年・月方式） -->
{% assign current_year = site.time | date: "%Y" | plus: 0 %}
{% assign current_month = site.time | date: "%m" | plus: 0 %}
{% if current_month >= 4 %}
  {% assign current_fy = current_year %}
{% else %}
  {% assign current_fy = current_year | minus: 1 %}
{% endif %}

{% for c in site.publications_collaborative_research %}

  {%- comment -%} 開始 FY（begin_year が無い場合はスキップ） {%- endcomment -%}
  {% if c.begin_year %}
    {% if c.begin_month >= 4 %}
      {% assign fy_begin = c.begin_year %}
    {% else %}
      {% assign fy_begin = c.begin_year | minus: 1 %}
    {% endif %}
  {% else %}
    {% continue %}
  {% endif %}

  {%- comment -%} 終了 FY（未指定 or 未来なら現在まで） {%- endcomment -%}
  {% if c.end_year %}
    {% if c.end_month >= 4 %}
      {% assign fy_end_raw = c.end_year %}
    {% else %}
      {% assign fy_end_raw = c.end_year | minus: 1 %}
    {% endif %}
  {% else %}
    {% assign fy_end_raw = current_fy %}
  {% endif %}

  {%- comment -%} 未来年度を現在で cap {%- endcomment -%}
  {% if fy_end_raw > current_fy %}
    {% assign fy_end = current_fy %}
  {% else %}
    {% assign fy_end = fy_end_raw %}
  {% endif %}

  {%- comment -%} 異常値ガード {%- endcomment -%}
  {% if fy_begin < 1900 or fy_end < fy_begin %}
    {% continue %}
  {% endif %}

  {% for fy in (fy_begin..fy_end) %}
    {% unless fys contains fy %}
      {% assign fys = fys | push: fy %}
    {% endunless %}
  {% endfor %}
{% endfor %}


<!-- 年度を降順ソート -->
{% assign fys = fys | sort | reverse %}


<!-- 年度ごとのCSS作成 -->
<style>
  {% for fy in fys %}
  #fy{{ fy }}:checked ~ .fy-section[data-fy="{{ fy }}"] {
    display:block;
  }
  {% endfor %}
</style>



<div class="publications">
  <!-- 全列挙タブ -->
  <input type="radio" name="fy" id="fyall" checked>
  <label for="fyall">All</label>

  <!-- 年度ごとのタブ -->
  {% for fy in fys %}
    <input type="radio" name="fy" id="fy{{ fy }}">
    <label for="fy{{ fy }}">{{ fy }}年度</label>
  {% endfor %}

  <!-- 全列挙セクション -->
  <section class="all-section">
    <h2>Books</h2>
    <ul>
      {% for b in site.publications_books reversed %}
        {% include publication_book.html publication=b %}
      {% endfor %}
    </ul>
    <h2>Papers</h2>
    <ul>
      {% for p in site.publications_papers reversed %}
        {% include publication_paper.html publication=p %}
      {% endfor %}
    </ul>
    <h2>Awards</h2>
    <ul>
      {% for a in site.publications_awards reversed %}
        {% include publication_award.html award=a %}
      {% endfor %}
    </ul>
    <h2>Collaborative Research</h2>
    <ul>
    {% assign collabs = site.publications_collaborative_research | sort_collaborative %}
    {% for c in collabs %}
      {% include publication_collaboration.html collaboration=c %}
    {% endfor %}
  </ul>

  </section>

  <!-- 各年度のセクション -->
  {% for fy in fys %}
  <section class="fy-section" data-fy="{{ fy }}">

    <!-- その年度のBooksリストアップ -->
    {% assign fybooks = "" | split: "" %}
    {% for b in site.publications_books %}
      {% if b.month >= 4 %}
        {% assign bfy = b.year %}
      {% else %}
        {% assign bfy = b.year | minus: 1 %}
      {% endif %}
      {% if bfy == fy %}
        {% assign fybooks = fybooks | push: b %}
      {% endif %}
    {% endfor %}
    <!-- reverse -->
    {% assign fybooks = fybooks | sort | reverse %}
    


    <!-- その年度のPapersリストアップ -->
    {% assign fypapers = "" | split: "" %}
    {% for p in site.publications_papers %}
      {% if p.month >= 4 %}
        {% assign pfy = p.year %}
      {% else %}
        {% assign pfy = p.year | minus: 1 %}
      {% endif %}
      {% if pfy == fy %}
        {% assign fypapers = fypapers | push: p %}
      {% endif %}
    {% endfor %}
    <!-- reverse -->
    {% assign fypapers = fypapers | sort | reverse %}


    <!-- その年度のAwardsリストアップ -->
    {% assign fyawards = "" | split: "" %}
    {% for a in site.publications_awards %}
      {% if a.month >= 4 %}
        {% assign afy = a.year %}
      {% else %}
        {% assign afy = a.year | minus: 1 %}
      {% endif %}
      {% if afy == fy %}
        {% assign fyawards = fyawards | push: a %}
      {% endif %}
    {% endfor %}



    <!-- その年度のCollaborative Research をリストアップ -->
    <!-- begin と end の期間が年度にかかっているもの -->
    {% assign fycollabs = "" | split: "" %}
    {% assign fycollabs =
      site.publications_collaborative_research
      | collabs_in_fy: fy
      | sort_collaborative
    %}

    <!-- Bookがあったら表示 -->
    {% if fybooks.size > 0 %}
      <h2>Books</h2>
      <ul>
        {% for b in fybooks %}
          {% include publication_book.html publication=b %}
        {% endfor %}
      </ul>
    {% endif %}

    <!-- Paperがあったら表示 -->
    {% if fypapers.size > 0 %}
      <h2>Papers</h2>
      <ul>
        {% for p in fypapers %}
          {% include publication_paper.html publication=p %}
        {% endfor %}
      </ul>
    {% endif %}

    <!-- Awardsがあったら表示 -->
    {% if fyawards.size > 0 %}
      <h2>Awards</h2>
      <ul>
        {% for a in fyawards %}
          {% include publication_award.html award=a %}
        {% endfor %}
      </ul>
    {% endif %}

    <!-- Collaborative Researchがあったら表示 -->
    {% if fycollabs.size > 0 %}
      <h2>Collaborative Research</h2>
      <ul>
        {% for c in fycollabs %}
          {% include publication_collaboration.html collaboration=c %}
        {% endfor %}
      </ul>
    {% endif %}

  </section>
  {% endfor %}

</div>


