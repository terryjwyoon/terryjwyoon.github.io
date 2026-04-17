# Blogging Guide — Poin Lab

Quick reference for adding posts and categories to [terryjwyoon.github.io](https://terryjwyoon.github.io/).

---

## Git Workflow

Always write on the `develop` branch. Deploy to `master` only when ready to publish.

```bash
git checkout develop   # make sure you're on develop before writing
```

To deploy (merge develop → master and push):

```bash
bash TY_git_deploy.sh
```

> `TY_git_deploy.sh` does: checkout master → merge develop (no-ff) → git push --all → checkout develop

---

## Adding a Post

### 0. Copy the template

A ready-to-use template with all available syntax is at:

```
TY/post-template.md
```

Copy it, rename it to `YYYY-MM-DD-slug.md`, place it in `_posts/`, and delete the example content before writing.

### 1. Create the file

Place the file in `_posts/` or in a subfolder under `_posts/` (subfolder is just for your own organization — it doesn't affect the URL).

**File naming rule:** `YYYY-MM-DD-slug.md`

```
_posts/
  YYYY-MM-DD-slug.md          ← works
  DevServer/
    YYYY-MM-DD-slug.md        ← also works (subfolder = personal organization only)
  Embedded_Linux/
    YYYY-MM-DD-slug.md
```

### 2. Add front matter

Copy this template and fill in the fields:

```yaml
---
layout: single
title:  "[Category] Post Title Here"
categories:
  - category_name           # determines the URL: /<category_name>/<slug>/
tag: [tag1, tag2]
author_profile: false
typora-root-url: ../        # keeps Typora image preview working
# search: false             # uncomment to hide from search
---
```

| Field | Description |
|---|---|
| `layout` | Always `single` for regular posts |
| `title` | Displayed title. Convention: `"[Category] Title"` |
| `categories` | One value = `/<category>/<slug>/` URL. Use same spelling consistently. |
| `tag` | Array of tags. Shown on /tags/ page. |
| `author_profile` | `false` hides the left sidebar profile. |
| `typora-root-url: ../` | Required for images to render in Typora. |

### 3. Write the post body

Standard Markdown. The post content starts below the closing `---`.

### 4. Resulting URL

The URL is built from `permalink: /:categories/:title/` in `_config.yml`.

```
categories: linux
slug (from filename): screen

→ https://terryjwyoon.github.io/linux/screen/
```

---

## Adding Images

### 1. Create an image folder

Create a folder in `images/` named after the post's date-slug:

```
images/
  YYYY-MM-DD-slug/
    photo.jpg
    diagram.png
```

### 2. Reference in the post

```markdown
![alt text](/images/YYYY-MM-DD-slug/photo.jpg)
```

The `typora-root-url: ../` front matter field makes this preview correctly inside Typora.

---

## Adding a New Category

### What happens automatically

As soon as you use a new value in `categories:`, it appears on the `/categories/` page at [terryjwyoon.github.io/categories/](https://terryjwyoon.github.io/categories/). **No extra file is needed** for this.

### Optional: dedicated category page

If you want a standalone page at `/categories/<name>` (e.g., for linking from the nav), create:

**File:** `_pages/categories/category-<name>.md`

```yaml
---
title: "Display Name"
layout: archive
permalink: categories/<name>
author_profile: true
sidebar_main: true
---

{% assign posts = site.categories.<name> %}
{% for post in posts %} {% include archive-single2.html type=page.entries_layout %} {% endfor %}
```

Replace `<name>` with the exact string used in `categories:` in the post front matter.

#### Example

Post uses `categories: embedded_linux` → create `_pages/categories/category-embedded_linux.md` with `permalink: categories/embedded_linux`.

### Add the category to the sidebar nav

The **left sidebar category menu** (post counts, grouped headings) is controlled by:

```
_includes/nav_list
```

This file is **not** updated automatically — you must edit it manually when adding a new category.

**Structure of `nav_list`:**

```html
<span class="nav__sub-title">Group Heading</span>
<ul>
  {% for category in site.categories %}
    {% if category[0] == "category_name" %}
      <li><a href="/categories/category_name">Display Name ({{category[1].size}})</a></li>
    {% endif %}
  {% endfor %}
</ul>
```

**To add a new category to the sidebar:**
1. Copy one of the existing `<ul>...</ul>` blocks
2. Change `category[0] == "category_name"` to match your new category string
3. Change the `href` and display name accordingly
4. Place it under the appropriate `<span class="nav__sub-title">` group heading, or add a new heading

---

## Local Preview

### Install Jekyll (Mac, Apple Silicon — one-time setup)

Follow the official guide: https://jekyllrb.com/docs/installation/macos/

Key command for ARM Macs:
```bash
arch -arm64 ruby-install ruby 3.4.1
```

### Serve locally

Open the `Blog-github` workspace folder in terminal, then:

```bash
bundle exec jekyll serve
```

Then open [http://127.0.0.1:4000](http://127.0.0.1:4000).

---

## Checklist

### New post

- [ ] On `develop` branch
- [ ] File at `_posts/<OptionalFolder>/YYYY-MM-DD-slug.md`
- [ ] Front matter filled in (`layout`, `title`, `categories`, `tag`, `typora-root-url: ../`)
- [ ] Images in `images/YYYY-MM-DD-slug/` if any
- [ ] Preview locally with `bundle exec jekyll serve`
- [ ] `git add`, `git commit`, then `bash TY_git_deploy.sh`

### New category

- [ ] Use the new category name in a post's `categories:` field
- [ ] Create `_pages/categories/category-<name>.md` for a dedicated page
- [ ] Edit `_includes/nav_list` to add the category to the sidebar menu
- [ ] Use the **exact same spelling** everywhere (it's case-sensitive)

---

## Current Categories

| Category | Dedicated page | URL |
|---|---|---|
| `linux` | `_pages/categories/category-linux.md` | `/categories/linux` |
| `embedded_linux` | `_pages/categories/category-embedded_linux.md` | `/categories/embedded_linux` |
| `embedded` | — (auto only) | appears under `/categories/` |
| `docker` | — (auto only) | appears under `/categories/` |
| `cattest` | `_pages/categories/category-cattest.md` | `/categories/cattest` |

---

## File Structure Reference

```
_posts/                          ← all posts go here
  DevServer/                     ← personal subfolder (no effect on URL)
    YYYY-MM-DD-slug.md
  Embedded_Linux/
    YYYY-MM-DD-slug.md
  YYYY-MM-DD-slug.md

_pages/
  categories/
    category-<name>.md           ← dedicated category page (optional)
  category-archive.md            ← main /categories/ page (don't touch)
  tag-archive.md
  search.md

images/
  YYYY-MM-DD-slug/               ← images for a specific post
    photo.jpg

_data/
  navigation.yml                 ← top nav links (Category, Tag, Search)

_config.yml                      ← site settings (rarely change)

TY_git_deploy.sh                 ← deploy script
```
