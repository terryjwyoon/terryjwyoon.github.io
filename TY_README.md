arch -arm64 ruby-install ruby 3.4.1
bundle exec jekyll serve

127.0.0.1:4000

- 카테고리
    - 글은 `_posts` 폴더에
    - 카테고리 새로 만들면 `_pages/categories` 안에 `.md`파일로 각 카테고리별 페이지 파일을 만듦 → post grouping backend
    - 실제 보이는 카테고리 구조는 `_includes/nav_list` 파일에서 수정