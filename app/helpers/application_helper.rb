module ApplicationHelper
  def company_logo_icon(extra_classes = "w-6 h-6", fill_color = "currentColor")
    settings = SiteSetting.pluck(:key, :value).to_h rescue {}
    logo_val = settings['logo_url'] || settings['company_logo_svg']

    if logo_val.present? && logo_val.start_with?('http')
      image_tag(logo_val, alt: settings['company_name'] || "Crown Cleaners", class: "#{extra_classes} object-contain")
    elsif logo_val.present?
      logo_val.html_safe
    else
      <<-SVG.html_safe
        <svg xmlns="http://www.w3.org/2000/svg" class="#{extra_classes}" fill="#{fill_color}" viewBox="0 0 24 24">
          <path d="M5 16L3 5l5.5 5L12 4l3.5 6L21 5l-2 11H5zm14 3a1 1 0 01-1 1H6a1 1 0 01-1-1v-1h14v1z"/>
        </svg>
      SVG
    end
  end
end