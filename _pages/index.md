---
layout: home
permalink: /
author_profile: false
pagination:
    enabled: true
    collection: 'posts'
    per_page: 3
---

<div class="alsc-banner">
    <img src={{ '/assets/img/logo/19_alsc-logo-ninjal-ja-en.jpg' | relative_url }} alt="ALSCロゴ" class="alsc-logo">
</div>

<h2 class="archive__subtitle">{{ site.data.ui-text[site.locale].recent_posts | default: "Recent Posts" }}</h2>

{% if paginator %}
  {% assign posts = paginator.posts %}
{% else %}
  {% assign posts = site.posts %}
{% endif %}

{% assign entries_layout = page.entries_layout | default: 'list' %}
<div class="entries-{{ entries_layout }}">
  {% include documents-collection.html entries=posts type=entries_layout %}
</div>

{% include paginator.html %}

<h2 class="archive__subtitle">About Center</h2>

<p>
本センターは、最新の統計モデリング技術（ベイズ統計・深層学習など）を用い、 実証的な言語研究（音声科学・認知科学・コーパス・言語理論）を推進します。<br>
<br >
The center will promote empirical language research (including phonetics, cognitive science, corpora, and linguistic theory) using state-of-the-art statistical modeling techniques such as Bayesian statistics and deep learning.<br>
<br>
<a class="btn--primary link-btn" href={{ "/about" | relative_url}}>Read More</a>
</p>