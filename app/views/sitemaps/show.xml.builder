<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc><%= root_url %></loc>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc><%= privacy_url %></loc>
    <changefreq>monthly</changefreq>
    <priority>0.3</priority>
  </url>
  <url>
    <loc><%= terms_url %></loc>
    <changefreq>monthly</changefreq>
    <priority>0.3</priority>
  </url>
  <% @services.each do |service| %>
    <url>
      <loc><%= service_detail_url(service) %></loc>
      <lastmod><%= service.updated_at.iso8601 %></lastmod>
      <changefreq>weekly</changefreq>
      <priority>0.8</priority>
    </url>
  <% end %>
</urlset>