 ---
  title: "category test"
  layout: archive
  permalink: categories/cattest
  author_profile: true
  sidebar_main: true
  ---
  
  {% assign posts = site.categories.cattest %}
  {% for post in posts %} {% include archive-single2.html type=page.entries_layout %} {% endfor %}