---
# ============================================================
#  FRONT MATTER — copy this block to the top of every new post
# ============================================================

layout: single
title:  "[Category] Post Title Here"

# Categories & Tags
# - categories value becomes part of the URL: /<category>/<slug>/
# - Use one category per post (string matching in nav_list is exact)
categories:
  - linux              # linux | embedded_linux | embedded | docker | cattest | (new)

tag: [tag1, tag2]      # shown on /tags/ page, any free-form words

# Sidebar / layout
author_profile: false  # true = show profile card on left | false = hide it
typora-root-url: ../   # keeps Typora image preview working — keep this line

# Optional overrides (uncomment to use)
# search: false        # hide this post from the search page
# toc: false           # disable Table of Contents for this post only
# comments: false      # disable comments for this post only
---

<!-- ============================================================
     BODY STARTS HERE
     Delete everything below the closing --- when writing a real post.
     ============================================================ -->


# Heading 1  (H1 — usually the main section title)

## Heading 2  (H2 — subsection)

### Heading 3  (H3 — sub-subsection)


<!-- ============================================================
     TEXT FORMATTING
     ============================================================ -->

Normal paragraph text goes here.

**Bold text**  
*Italic text*  
~~Strikethrough~~  
`inline code`  

> Blockquote — use for quotes or callout phrases.


<!-- ============================================================
     LISTS
     ============================================================ -->

Unordered list:
- Item A
- Item B
  - Nested item

Ordered list:
1. First step
2. Second step
3. Third step


<!-- ============================================================
     LINKS
     ============================================================ -->

[Link text](https://example.com)

<!-- Link that opens in a new tab -->
[Link text](https://example.com){:target="_blank"}


<!-- ============================================================
     CODE BLOCKS
     Supported language tags: bash, c, cpp, python, yaml, json, ...
     ============================================================ -->

```bash
# Shell / terminal commands
sudo apt-get install <package>
bundle exec jekyll serve
```

```c
// C code
#include <stdio.h>
int main(void) {
    printf("Hello\n");
    return 0;
}
```

```cpp
// C++ code
#include <iostream>
int main() {
    std::cout << "Hello" << std::endl;
}
```

```python
# Python
def hello():
    print("Hello")
```


<!-- ============================================================
     IMAGES
     1. Put image files in:  images/YYYY-MM-DD-slug/filename.ext
     2. Reference like this: /images/YYYY-MM-DD-slug/filename.ext
     typora-root-url: ../ in front matter makes Typora preview work.
     ============================================================ -->

![Alt text description](/images/YYYY-MM-DD-slug/filename.jpg)

<!-- Image with caption (HTML) -->
<figure>
  <img src="/images/YYYY-MM-DD-slug/filename.jpg" alt="Alt text">
  <figcaption>Caption text shown below the image.</figcaption>
</figure>


<!-- ============================================================
     NOTICE BOXES  (Minimal Mistakes built-in)
     ============================================================ -->

<!-- Blue — general info -->
**Note:** This is a default notice.
{: .notice}

<!-- Blue — primary highlight -->
**Note:** This is a primary notice.
{: .notice--primary}

<!-- Green — success / tip -->
**Tip:** This is a success notice.
{: .notice--success}

<!-- Yellow — caution -->
**Warning:** This is a warning notice.
{: .notice--warning}

<!-- Red — danger / critical -->
**Danger:** This is a danger notice.
{: .notice--danger}

<!-- Multi-line notice (use HTML div for multiple lines) -->
<div class="notice--info">
  <h4>Info Title</h4>
  <ul>
    <li>Point one</li>
    <li>Point two</li>
  </ul>
</div>


<!-- ============================================================
     BUTTONS
     Colors: --primary | --success | --warning | --danger | --info
     Sizes:  --large | (default) | --small | --x-small
     ============================================================ -->

[Button label](https://example.com){: .btn .btn--primary}
[Danger button](https://example.com){: .btn .btn--danger}
[Large button](https://example.com){: .btn .btn--success .btn--large}


<!-- ============================================================
     YOUTUBE VIDEO EMBED
     Replace VIDEO_ID with the YouTube video ID from the URL.
     e.g. https://www.youtube.com/watch?v=aLZVTP8SlkE  → id="aLZVTP8SlkE"
     ============================================================ -->

{% include video id="VIDEO_ID" provider="youtube" %}


<!-- ============================================================
     TABLES
     ============================================================ -->

| Column A | Column B | Column C |
|---|---|---|
| Row 1A | Row 1B | Row 1C |
| Row 2A | Row 2B | Row 2C |

<!-- Right-align a column -->
| Left | Center | Right |
|:---|:---:|---:|
| L | C | R |


<!-- ============================================================
     HORIZONTAL RULE
     ============================================================ -->

---


<!-- ============================================================
     REFERENCES SECTION  (common pattern in this blog)
     ============================================================ -->

## References

- [Reference title](https://example.com)
- [Reference title 2](https://example.com)
