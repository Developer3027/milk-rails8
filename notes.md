## Root Function.
The app is comprised of several apps in one. The root is a simple layout with links. The top link is the blog. Light / dark mode toggle to the left and info toggle to the right. Dark mode will default to the browser of operating system via tailwind. About half the links on the root are informational links but many can point directly to either the project or client. Each of those direct links can also have information sections on the info page. The info toggle will toggle the links to either info or direct.

Some of the links on root may need a lot of explaining where others will run shallow. I decided to provide one info page for all links and build specific sections for the links. This will be re-evaluated as I go.

### employer
The employer section is for those looking to hire me for employment and will include my resume as well as other information that I need to provide to someone who is looking to hire me for a job. Now that the Figma design is in progress, this page will need a model. This page will include badges and project cards.

### client
The Client section is for those who are looking to hire me to build a project for them. The info toggle will take them to the information page where links to Fivver and Upwork as well as reasons to hire me, are located or the sign in if they are a client. Here there is a dashboard with info on the site build, issues tab where they can create a issue. A internal email where they can email me in house. A chat option if I am logged in.

You removed the info toggle and added the admin mug icon. Ade devise an ran install. Removed the registerable from the milk_admin model. Need to create seed for milk_admin and create dashboard, fix routeing.

## Swabbie
This app targets YouTube content providers with the specialty of Sailing, whether that is building or remolding a boat to sailing a vessel. Many content providers use other, external services like Patreon, Go Fund Me or PayPal to assist in gathering funds. They use services like instagram or facebook to drive social interactions. They use services like Bonfire or Spreadshop to sell personalized products to assist in funding. This app aims to be a one stop shop for such content creators, where they can manage all these aspects from a central location and not juggle between services.

Lets's look at these individually. First and foremost would be the content. There will be a way to save your own content for those who want to start from scratch or be exclusive to the platform, however that probably will not be the main focus for many as this is specifically designed for those creators who already have a YouTube channel. Use the YouTube API to populate the video content for the platform. For file storage use AWS S3.

For crowd funding, Patreon, which seems to be most common, does have both an API and a Ruby gem. Further research is needed but from a glance I can use the patreon api to use patreon service and present them in the app. Or creating the identical services in app and passing information to Patreon. Either way the content provider can use and manage the Patreon service through the app. In addition one can also use Stripe or Paypal to create a more in house service for new users.

For social like facebook or instagram, they both have API's that can work for the app. Post a image via the instagram app and it will show up in the app via the api. Review specific data via api as well. Again, can have scaled down version for the app to be functional without those accounts.

## Development Pricing

**How Much Does a Website Cost?**

One of the first questions you’ll ask is, _“How much will this cost?”_—and that’s a great place to start. The answer depends on what you need. A simple restaurant site showcasing a static menu is vastly different from one requiring frequent updates, online reservations, or e-commerce functionality. To get an accurate estimate, we’ll need to discuss your goals, answer key questions, and build a plan tailored to your business.

**The DIY Route: Possible, But Not Always Simple**

There’s no shortage of DIY platforms like Wix, Squarespace, Shopify, or WordPress—many of which handle domain registration and hosting for you. These tools are user-friendly and a solid option for those willing to invest time in learning.

But here’s the catch: **Even the simplest website involves more than just dragging and dropping elements**. You’ll need to consider:

**SEO** (Will customers find you on Google?)

**Security** (Is your site—and your customers' data—protected?)

**Mobile Responsiveness** (Does it work flawlessly on phones and tablets?)

**Maintenance** (Who updates content, plugins, and security patches?)

**Performance** (Does it load quickly, or will visitors bounce?)

You can research all this (Google and AI tools like ChatGPT help!), but many business owners quickly feel overwhelmed. That’s where we come in.

**What’s the Investment? A Realistic Breakdown**

You have options beyond the DIY route. From Freelancers like myself, to big corporate agencies, the world is yours. All have pros and cons. From that personal touch to time to market. At the end of the day, we know you have choices. Building a website includes time for design, development, content creation, and testing. For a basic, 4 - 6 page site it takes roughly between 40 - 80 hours. My rate is 50 an hour, so a basic website will cost between $2,000 and $4,000. Maybe we can help you get started, help educate, and let you decide what's right for you. As for that return on investment, let's see what we're looking at. To give you a ballpark idea, here’s what website costs typically look like:

**Standard Site** (Static, no frills) – 
0
–
0–5,000 + domain/hosting/subscription fees

**Small Business Site** (Interactive, data-driven) – 
1
,
000
–
1,000–10,000

**Corporate or E-Commerce Site** (Advanced features, scalability) – 
8
,
000
–
8,000–50,000+

**What affects pricing?**

**Customization** (Unique design vs. template-based)

**Functionality** (Contact forms, booking systems, member logins, etc.)

**Content & SEO** (Professional copywriting, keyword optimization)

**Ongoing Support** (Updates, security monitoring, backups)

**How We Keep Costs Manageable**

Want to save without sacrificing quality? Start with a template. Building a site or web app includes time for design, development, content creation and testing. If you find a design you like, we can customize it and add the functionality you need—saving time and budget. Any HTML template can be easily converted, but many templates designed for other systems can also easily convert to React or Rails.

**Still unsure?** Try our **free price estimator** to get a clearer idea of what your project could cost. Just answer a few quick questions, and we’ll factor in everything from SEO to mobile responsiveness.

Your website is your digital storefront. Let’s build one that works for you—not one that leaves you frustrated and Googling at 2 AM.

[Get Your Estimate Now] [Talk to an Expert]

* base website - 3 pages - 1,500
* SPA website - javascript library - 3,000
* landing page - single page - 500 - 3,000

* SEO - basic site - 50/hr
* Content - 50/hr
* Performance - lighthouse score - 50/hr
* Mobile - 50/hr
* API Endpoint - 50/hr
* Data - 50/hr
* Auth - 50/hr
* Hosting - 
* Domain Registration - 

**Pricing model**

**General level pricing**

template - 800 - 1,600
standard - 2,000 - 3,000
advanced - 3,000 - 5,000
professional - 5,000 - 10,000

**site type** - Standard, Small Business, Corporate (Starts with lowest number in type, must have style)

Standard - 800 - 5,000
Small Business - 1,000 - 10,000
Corporate - 8,000 - 50,000

**number of pages** - 6 hours per page

Web sites used to be thought of as digital books. Today that is not the case, but whether you are thinking about a single page application (spa) or a e-commerce platform, think about what information will be presented after each click. The information that will fill the screen. In general, that could be considered a "page". For instance, if you have a spa design, then you may have a about link in the navbar. That about section could be considered a page. Some about sections may be extensive, but others may be a simple paragraph. Don't get hung up on how much content may constitute a page. Remember this is just a estimator and will provide a general idea for a price. This is not binding, just a tool to help you make a decision. We can speak further to get a more focused price to get you exactly what you need.

**style / design** - have template, standard, advanced, professional

Style is important to consider. Some may want simple layouts with basic colors, no animations, no fancy links or buttons. Others may be looking for rich contrasts with professional animations and complex layouts. Some may need to compete in the marketplace at large, others may just need simple and effective. Consider, a tax specialist needing to keep and organize information really wouldn't have use for a blazing 3d shoe card that is interactive and grabs the buyers attention.

**copywriting / content** - 3 hours per page

Some may have no content, just the idea for the site or app. Others may have written volumes. I will use mix of AI and my own experience to either help you create content or work through the volumes to filter down to the best content with the best hooks, providing a concise and focused message for your site or app.

**responsive** - yes, no

Some may need the site for desktop only. Others may need it to be accessible on any device. This default is yes because a majority want the site of app to work flawless on mobile devices as well as on a laptop or desktop. This requires a bit of forward thinking with respect to style and images.

**SEO** - Technical, content, UX, professional

There are several levels to search engine optimization (seo).
* technical - optimize website speed, responsive, sitemaps.
* content -  high quality, relevant and engaging content optimized for specific keywords and search intent.
* ux - designing a user-friendly site that is easy to navigate with a positive user experience to include link cards.
Link building is another seo feature to consider. Back links from reputable websites tell search engines your site is valuable. To get noticed and placed through the various search engines, seo is a huge consideration.

**Database** - standard, advanced, professional - MongoDB / PostgreSQL

Some sites need to store or provide information. It is a given that site like an e-commerce, cms, or blog will require a database. This setting is intended for those site that fall outside the scope of these popular choices. Some may simply need to collect email address while others my need to provide regular updates in the same format, like the daily specials of a restaurant.

**e-commerce** - standard, advanced, professional - RoR / React, Express / React, Rails

Online store. You need to buy or sell something to the greater market of the internet. Whether you want to remain local but provide services to everyone in that local area, or your going global, a e-commerce site is what you are looking for. There is a lot to do here. This will require a frontend and backend with database integration. Lot's of functionality for both the customer and the admin.

**cms** - standard, advance, professional - RoR / React, Express / React, Rails

Do you need to organize your data? Do you need a better way to search within your data, collect data, or organize it in a specific way? There is a lot to do here. This will require a frontend and backend with database integration. Lot's of functionality for both the customer and the admin.

**blog** - standard, advanced, professional RoR / React, Express / React, Rails

Do you love to write or perhaps teach? Do you need a better way to communicate with your fans, group, loved ones, or maybe you just need a better way to collect those thoughts. There is a lot to do here. This will require a frontend and backend with database integration. Lot's of functionality for both the customer and the admin.

 