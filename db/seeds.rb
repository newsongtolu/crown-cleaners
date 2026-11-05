# Clear existing data to avoid duplicates on re-seeding
Enquiry.destroy_all rescue nil
Service.destroy_all rescue nil
SiteSetting.destroy_all rescue nil
AdminUser.destroy_all rescue nil
Testimonial.destroy_all rescue nil if defined?(Testimonial)

# 1. Create Default Super Admin
AdminUser.create!(
  email: "crowncleanersuk9@gmail.com",
  password: "AdminPassword2004!",
  password_confirmation: "AdminPassword2004!"
)
puts "-> Created Super Admin: crowncleanersuk9@gmail.com"

# 2. Create Dynamic Site Settings (Includes Editable Logo URL & Contact Details)
settings = [
  { key: "company_name", value: "Crown Cleaners Limited", description: "Main Company Name" },
  { key: "site_title", value: "Crown Cleaners Limited", description: "Site Title" },
  { key: "phone", value: "0113 496 2200", description: "Primary Landline Phone" },
  { key: "phone_number", value: "07510883054", description: "Mobile Contact Phone" },
  { key: "email", value: "hello@crowncleaners.co.uk", description: "Primary Public Email" },
  { key: "contact_email", value: "crowncleanersuk9@gmail.com", description: "Notification Email" },
  { key: "location", value: "Leeds & West Yorkshire", description: "Operating Region" },
  { key: "logo_url", value: "", description: "Navbar Logo Image URL (Leave blank for default shield logo)" },
  { key: "hero_headline", value: "Precision care for spaces that matter.", description: "Main Homepage Hero Title" },
  { key: "hero_subtext", value: "Commercial, healthcare, care and community premises, kept to a standard that stands inspection — quietly, consistently, and with the records to prove it.", description: "Homepage Hero Subtitle" }
]

settings.each do |setting|
  SiteSetting.find_or_create_by!(key: setting[:key]) do |s|
    s.value = setting[:value]
    s.description = setting[:description] if s.respond_to?(:description=)
  end
end
puts "-> Created/Updated #{settings.length} Site Settings (including Logo URL)"

# 3. Create Core Cleaning Services with Image URLs & Specifications
services = [
  {
    title: "Commercial & Office Cleaning",
    slug: "commercial-office-cleaning",
    description: "Reliable, contract-based cleaning for corporate offices, retail spaces, and business premises across Leeds and West Yorkshire.",
    image_url: "https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=800&auto=format&fit=crop",
    icon: "building",
    position: 1,
    active: true
  },
  {
    title: "Supported Living Cleaning",
    slug: "supported-living-cleaning",
    description: "Sensitive, high-standard hygiene maintenance for supported living environments, ensuring safety and comfort for vulnerable residents.",
    image_url: "https://images.unsplash.com/photo-1584515979956-d9f6e5d09982?q=80&w=800&auto=format&fit=crop",
    icon: "home",
    position: 2,
    active: true
  },
  {
    title: "Healthcare Facility Cleaning",
    slug: "healthcare-cleaning",
    description: "Rigorous, clinical-grade disinfection and sanitization adhering strictly to healthcare regulatory standards and infection control.",
    image_url: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=800&auto=format&fit=crop",
    icon: "shield-check",
    position: 3,
    active: true
  },
  {
    title: "Housing & Property Management",
    slug: "housing-property-management",
    description: "End-of-tenancy, communal area, and block management cleaning services for landlords, letting agents, and property managers.",
    image_url: "https://images.unsplash.com/photo-1527515637462-cff94eecc1ac?q=80&w=800&auto=format&fit=crop",
    icon: "key",
    position: 4,
    active: true
  },
  {
    title: "Community Facilities",
    slug: "community-facilities",
    description: "Comprehensive janitorial and deep sanitation for community centers, places of worship, schools, and public halls.",
    image_url: "https://images.unsplash.com/photo-1517502884422-41eaead166d4?q=80&w=800&auto=format&fit=crop",
    icon: "users",
    position: 5,
    active: true
  },
  {
    title: "Deep Cleaning & Specialist Services",
    slug: "deep-cleaning-specialist",
    description: "Heavy-duty restoration, builder clean-ups, carpet shampooing, and one-off sparkle cleans for demanding environments.",
    image_url: "https://images.unsplash.com/photo-1581578731548-c64695cc6952?q=80&w=800&auto=format&fit=crop",
    icon: "sparkles",
    position: 6,
    active: true
  }
]

services.each do |service|
  Service.create!(service)
end
puts "-> Created #{services.length} Core Services"

# 4. Create Initial Default Testimonials
if defined?(Testimonial)
  testimonials = [
    {
      quote: "We needed a team that understood the difference between a tidy room and a space that is safe for residents. They did, and they kept the same people on the rota.",
      author_title: "Facilities lead",
      company_or_location: "Care setting, Leeds",
      rating: 5,
      position: 1,
      active: true
    },
    {
      quote: "The proposal was specific. Frequency, hours, what was included. After they started, the building simply looked as it should, every morning.",
      author_title: "Practice manager",
      company_or_location: "West Yorkshire",
      rating: 5,
      position: 2,
      active: true
    },
    {
      quote: "Communal areas are where residents judge a block. The standard has held, and when something needs reporting they actually tell us.",
      author_title: "Estates officer",
      company_or_location: "Housing association",
      rating: 5,
      position: 3,
      active: true
    }
  ]

  testimonials.each do |t|
    Testimonial.create!(t)
  end
  puts "-> Created #{testimonials.length} Testimonials"
end

puts "=== Seeding Completed Successfully! ==="