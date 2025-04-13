---
title: "Embedded"
layout: archive
permalink: categories/embedded
author_profile: true
sidebar_main: true
---
  
{% assign posts = site.categories.embedded %}
{% for post in posts %} {% include archive-single2.html type=page.entries_layout %} {% endfor %}