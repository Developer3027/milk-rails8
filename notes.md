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

