# ---- Builder: build Jekyll site ----
FROM jekyll/jekyll:4.3 AS builder

WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock* ./
RUN bundle config set --local path 'vendor/bundle' \
 && bundle install --quiet

COPY . .
# Ensure clean, reproducible build
RUN JEKYLL_ENV=production bundle exec jekyll build --trace --verbose

# ---- Runtime: serve static site with Nginx ----
FROM nginx:alpine

# Hardening + small optimizations
RUN adduser -D -g 'www' www \
 && mkdir -p /var/cache/nginx /etc/nginx/conf.d

# Basic Nginx config (Gzip, caching, security headers)
RUN printf '%s\n' \
 'server {' \
 '  listen 80; listen [::]:80;' \
 '  server_name _;' \
 '  root /usr/share/nginx/html;' \
 '  index index.html;' \
 '  # Security & performance headers' \
 '  add_header X-Content-Type-Options nosniff;' \
 '  add_header X-Frame-Options SAMEORIGIN;' \
 '  add_header X-XSS-Protection "1; mode=block";' \
 '  add_header Referrer-Policy no-referrer-when-downgrade;' \
 '  add_header Permissions-Policy "geolocation=(), microphone=(), camera=()";' \
 '  gzip on; gzip_types text/plain text/css application/javascript application/json image/svg+xml;' \
 '  location / {' \
 '    try_files $uri $uri/ =404;' \
 '  }' \
 '}' \
 > /etc/nginx/conf.d/default.conf

COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
