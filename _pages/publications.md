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


## Books

<div>
  <ol>
    {% for publication in site.publications_books reversed %}
      <li>
        {% include publication_book.html  %}
      </li>
    {% endfor %}

  </ol>

</div>



## Papers

<div>
  <ol>
    {% for publication in site.publications_papers reversed %}
      <li>
        {% include publication_paper.html  %}
      </li>
    {% endfor %}

  </ol>

</div>