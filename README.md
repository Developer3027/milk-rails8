# MILK-00

![Home screen for MILK-00](public/Screenshot%20from%202025-01-29%2021-02-58.png)

This project is my little informal little corner of the internet. It includes many projects that I have been working on over the past many years. Built in Rails, I continue to work this project daily. This project serves to showcase what I can do as a designer and developer as well as be both a client hub and learning center.

## Feature Projects
There are many projects I love and keep coming back to. With Rails I have been able to get them pulled together into one place to enjoy. Here is some information on each.

### Salt and Tar

![Root for Salt and Tar](public/Screenshot%20from%202025-01-29%2021-07-08.png)

This is a YouTube channel for sailing. Ruth and Garret have built Rediviva and the channel starts from the very beginning. Like many content creators, they juggle several accounts on various platforms. I thought they could use a site / app that gave them features they would use and enjoy while reducing the account overhead. For me, I want to enjoy there videos without the distractions of YouTube. I want the design to be a little different. I want the videos to have a old feel for the build and I want them to be framed like a poliroid picture. I would love to be able to book a overnight berthing or a day sail with them. I would love to bid on things when they are replaced on Rediviva. I would love to purchase merch or support them directly. All of this I will build into the remake. It is built with Rails, styled with Tailwind, larger files are stored in S3, and PostgeSQL is the database. This is a concept, of course. I hope everyone enjoys, and all the information is provided so you can easily support them. If I am honest, having just that home page that includes all those support links in one place, is an improvement.

![Archive for Salt and Tar](public/Screenshot%20from%202025-06-12%2017-17-07.png)

Here is the Archive that includes the first re-worked videos from the building of Rediviva in Washington state. They have a old feel with grain and static lines. The original video is linked with the youtube icon below the main video in the polaroid frame.

### Hermit Plus

![Root for Hermit Plus](public/Screenshot%20from%202025-01-29%2021-10-47.png)

Minecraft is a thing. The Hermits have really made it a thing to enjoy. This group of talented players have figured it out. I wanted a different way to enjoy them. Wanted them pulled together into one location. Like Netflix, but with only the Hermits. One YouTube they are spread out in all the noise. Then there is the fan art, the merch, the music for some. They deserve something more.

### Copywriter

![Root for Copywriter](public/Screenshot%20from%202025-01-29%2021-11-35.png)

This project and Barbershop were old Wordpress projects that I just loved the design. Several months back I started the clean up of my LinkedIn and decided to remake this one as all the others were lost. It then moved to here as I wrapped everything together. I did a little research and found a copywriter and decided to rebuild their site with my design. This is a concept but they are real. Wether you love or hate my work, I encourage you to give them a look.

### Blog

![Root for blog](public/Screenshot%20from%202025-01-29%2021-12-31.png)

I have recently started a SubStack account. I finally have this blog up and running. This is intended to help me and others, learn these concepts as I continue this journey. They will provide a glimpse of both my sense of humor and knowledge of design and development.


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  3.3.0

* System dependencies
  Tailwind, PostgreSQL, Ruby, 3.3.0, Rails 8, Devise, aws-s3, active storage and active text.

* Configuration
  Standard Rails configuration with Tailwind and PostgreSql

* Database creation
  Database.yml includes host, default username and password for PostgreSQL. My system does not include root access role under my name. These added config settings allow for quick and easy set up.

* Database initialization
  db:create, db:migrate, db:seed
  Seed file includes generic admin create and some dummy projects, skill pills and such.

* How to run the test suite
  Standard Rails system tests. Very few tests currently. 

* Deployment instructions
  Procfile, package.json set for Heroku deployment. Updated per dependabot requests.

* ...

<section class="bg-swabbie-st-drk-primary flex flex-col justify-center items-center w-full text-base-dark">

  <!-- Fake nav -->
  <div id="home" class="mt-8 w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]">
    <header class="static max-w-5xl">
      <div class="block rounded-t-lg bg-white">
        <div class="block max-w-5xl">
          <%= link_to root_path, class: "relative mt-1 ml-1" do %>
            <%= image_tag('https://milk-00.logo.svg', class: 'block ml-5') %>
          <% end %>
        </div>
      </div>
    </header>
  </div>

  <!-- Hero -->
  <div id="home" class="flex items-center justify-between bg-white w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]">
    <div class="flex flex-col items-center justify-center w-full">
      <div class="flex flex-col sm:flex-row justify-evenly w-full">
        <div class="flex flex-col items-center justify-center">
          <h1 class="text-center font-fell mt-10 text-5xl lg:text-7xl drop-shadow-dark">Salt and Tar</h1>
          <h3 class="text-center font-Inconsolata text-xl lg:text-2xl">
            Journey of a wooden boat
          </h3>
          <div class="flex justify-around my-16 w-full">
            <%= link_to "Archive", archive_salt_and_tar_index_path, class: "flex justify-center items-center h-12 w-32 mx-1 text-swabbie-st-drk-primary bg-white border-2 border-swabbie-st-drk-primary rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none" %>
            <%= link_to "MILK-00", root_path, class: "flex justify-center items-center h-12 w-32 mx-1 text-white bg-swabbie-st-drk-primary border-2 border-swabbie-st-drk-primary rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none" %>
          </div>
        </div>
        <div class="flex justify-center items-center">
          <%= image_tag('https://milk-00.Group+8.png', class: 'w-[15rem] drop-shadow-dark') %>
        </div>
      </div>
      <div class="mt-4">
        <%= image_tag('https://milk-00.Group+28.svg', alt: "border bottom") %>
      </div>
    </div>
  </div>

  <!-- promo div -->
  <div id="promotion" class="flex items-center justify-between bg-swabbie-st-lt-primary py-4 w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]">
    <div class="flex flex-col items-center justify-center w-full rounded-lg mx-2 bg-white">
      <div class="flex justify-between items-center mt-4">
        <div class="text-center font-fell text-4xl md:text-6xl drop-shadow-dark">
          <h1>New</h1>
        </div>
        <div>
          <%= image_tag('https://milk-00.logo.svg', class: 'block ml-5') %>
        </div>
        <div class="text-center font-fell text-4xl md:text-6xl drop-shadow-dark">
          <h1 class="">Wind</h1>
        </div>
      </div>
      <div class="max-w-md px-2 mb-3">
        <p class="text-center font-Inconsolata text-base">
          This is a fan site built by me, Developer3027. Below you can
          find different ways to help Salt and Tar build Rediviva.
        </p>
      </div>
      <div class="flex mb-4 w-full">
        <div class="md:flex flex-col justify-evenly w-full md:w-1/2 hidden">
          <div class="md:flex justify-evenly hidden my-3 w-full">
            <a href="https://www.youtube.com/@SaltandTar" target="_blank" referrerpolicy="strict-origin">
              <div class="flex flex-col items-end px-3 w-36  border border-swabbie-st-secondary rounded-lg bg-[url('https://milk-00.youtube.png')] bg-no-repeat bg-left">
                <h1 class="font-Inconsolata text-xl text-swabbie-st-primary font-bold">YouTube</h1>
                <p class="font-Inconsolata text-4xl font-bold">69K</p>
                <small class="font-Inconsolata text-base font-semibold">
                  subscribers
                </small>
              </div>
            </a>
            <a href="https://www.instagram.com/saltandtar/#" target="_blank" referrerpolicy="strict-origin">
              <div class="flex flex-col items-end px-3 w-36  border border-swabbie-st-secondary rounded-lg bg-[url('https://milk-00.insta.png')] bg-no-repeat bg-left">
                <h1 class="font-Inconsolata text-xl text-swabbie-st-primary font-bold">Instagram</h1>
                <p class="font-Inconsolata text-4xl font-bold">6K</p>
                <small class="font-Inconsolata text-base font-semibold">
                  followers
                </small>
              </div>
            </a>
          </div>
          <div class="md:flex justify-evenly hidden my-3 w-full">
            <a href="https://www.patreon.com/saltandtar" target="_blank" referrerpolicy="strict-origin">
              <div class="flex flex-col items-end px-3 w-36  border border-swabbie-st-secondary rounded-lg bg-[url('https://milk-00.patreon.png')] bg-no-repeat bg-left">
                <h1 class="font-Inconsolata text-xl text-swabbie-st-primary font-bold">Patreon</h1>
                <p class="font-Inconsolata text-4xl font-bold">283</p>
                <small class="font-Inconsolata text-base font-semibold">
                  members
                </small>
              </div>
            </a>
            <div class="flex flex-col items-end px-3 w-36  border border-swabbie-st-secondary rounded-lg bg-[url('https://milk-00.support.png')] bg-no-repeat bg-left">
              <h1 class="font-Inconsolata text-xl text-swabbie-st-primary font-bold">Supporters</h1>
              <p class="font-Inconsolata text-4xl font-bold">100%</p>
              <small class="font-Inconsolata text-base font-semibold">
                satisfied
              </small>
            </div>
          </div>
        </div>
        <div class="flex flex-col justify-around w-full md:w-1/2 px-3">
          <a href="https://www.patreon.com/saltandtar" target="_blank" referrerpolicy="strict-origin">
            <div class="flex flex-col w-full pl-2 border-l-4 border-swabbie-st-secondary mx-1 my-2 bg-swabbie-st-lt-secondary bg-opacity-30 rounded-r-lg">
              <h1 class="font-Inconsolata text-2xl text-swabbie-st-primary font-bold">Patreon</h1>
              <p class="text-center font-Inconsolata text-base px-2">
                A membership platform used to provide rewards and perks to
                subscribers.
              </p>
            </div>
          </a>
          <a href="https://www.youtube.com/@SaltandTar" target="_blank" referrerpolicy="strict-origin">
            <div class="flex flex-col w-full pl-2 border-l-4 border-swabbie-st-secondary mx-1 my-2 bg-swabbie-st-lt-secondary bg-opacity-30 rounded-r-lg">
              <h1 class="font-Inconsolata text-2xl text-swabbie-st-primary font-bold">YouTube</h1>
              <p class="text-center font-Inconsolata text-base px-2">
                A video sharing platform used to share the journey of
                building Rediviva.
              </p>
            </div>
          </a>
          <a href="https://www.instagram.com/saltandtar/#" target="_blank" referrerpolicy="strict-origin">
            <div class="flex flex-col w-full pl-2 border-l-4 border-swabbie-st-secondary mx-1 my-2 bg-swabbie-st-lt-secondary bg-opacity-30 rounded-r-lg">
              <h1 class="font-Inconsolata text-2xl text-swabbie-st-primary font-bold">Instagram</h1>
              <p class="text-center font-Inconsolata text-base px-2">
                A image sharing platform used to share pictures of the
                adventures in building Rediviva.
              </p>
            </div>
          </a>
          <a href="https://www.gofundme.com/f/saltandtar" target="_blank" referrerpolicy="strict-origin">
            <div class="flex flex-col w-full pl-2 border-l-4 border-swabbie-st-secondary mx-1 my-2 bg-swabbie-st-lt-secondary bg-opacity-30 rounded-r-lg">
              <h1 class="font-Inconsolata text-2xl text-swabbie-st-primary font-bold">GoFundMe</h1>
              <p class="text-center font-Inconsolata text-base px-2">
                A crowdfunding platform used to raise funding for building
                Rediviva.
              </p>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>

  <div id="features" class="flex flex-col justify-center items-center bg-swabbie-st-lt-primary h-[700px] w-96 sm:pb-16 sm:w-[640px] lg:w-[950px] xl:w-[1024px] rounded-b-lg border-yellow-500">
    <div class="flex flex-col items-center justify-between bg-swabbie-st-lt-primary w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]">
      <div class="flex items-center justify-center w-full h-[508px] bg-[url('https://milk-00.blue-st-banner.svg')]">
        <div class="flex flex-col m-2 justify-evenly items-center md:items-end w-full pt-8">
          <div class="flex justify-center items-center w-full md:w-[603px] h-full m-6 rounded-lg bg-swabbie-st-drk-primary">
            <div class="flex">
              <div class="flex flex-col justify-center items-center w-1/2">
                <p class=" bg-white text-base-dark p-2 m-3 rounded-sm text-sm">As the developer and designer of this app, I’m thrilled to feature Salt and Tar, the inspiring duo behind the handcrafted sailing vessel, Rediviva. <span class="hidden md:inline-block mt-2">Their passion for sailing and craftsmanship shines through every video and story. With a nostalgic polaroid feel and scratched, old school style video, it captures the essence of the journey of a wooden boat.</span></p>
                <%= link_to "Archive", archive_salt_and_tar_index_path, class: "flex justify-center items-center h-12 w-32 mx-1 mb-4 text-swabbie-st-drk-primary bg-white border-2 border-swabbie-st-drk-primary rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none" %>
              </div>
              <div class="flex justify-center items-center w-1/2">
              <%= image_tag('https://milk-00.card 163.jpg', class: 'drop-shadow-dark w-[10rem] md:w-full rotate-15 md:transform-none md:p-4') %>
              </div>
            </div>
          </div>
          <div class="flex justify-center items-center w-full md:w-[603px] h-full m-6 rounded-lg bg-swabbie-st-drk-primary">
            <div class="flex">
              <div class="flex justify-center items-center w-1/2">
              <%= image_tag('https://milk-00.player.png', class: 'drop-shadow-dark w-[10rem] md:w-full -rotate-15 md:transform-none md:p-4') %>
              </div>
              <div class="flex flex-col justify-center items-center w-1/2">
                <p class=" bg-white text-base-dark p-2 m-3 rounded-sm text-sm">I have modified the original video content to give it an vintage feel. I wanted to run with a different design concept. I focus on the initial build of Rediviva in Washington state. I encourage you to check out Salt and Tar’s videos and stories where you will find much higher quality, and tons more content. I have only sampled a small portion and hope I have done them justice.</p>
                <button class="border-2 border-swabbie-st-secondary rounded-lg bg-white text-base-dark mb-4 px-6 py-2">
                  Salt and Tar
                </button>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- video div -->
  <div id="video" class="flex flex-col items-center justify-between bg-swabbie-st-drk-primary w-96 sm:pb-16 sm:w-[640px] lg:w-[950px] xl:w-[1024px]">
    <div class="h-4 bg-st-lt-primary rounded-b-md w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]"></div>
    <div class="flex flex-col items-center justify-between bg-swabbie-st-drk-primary w-96 sm:w-[640px] lg:w-[950px] xl:w-[1024px]">
      <div class="flex items-center justify-center w-full mt-4 mb-44 bg-[url('https://milk-00.Group_30.svg')]">
        <div class="flex flex-col justify-center md:justify-normal mt-4 w-full md:w-1/2">
          <div class="flex flex-col items-center">
            <div class="flex flex-col items-center w-[320px]">
              <div class="flex w-full justify-end -mb-5 pr-3">
                <span class="font-fell text-4xl text-white text-end">
                  Salt and Tar
                </span>
              </div>
              <div class="flex justify-start w-full">
                <h1 class="font-fell text-9xl text-white">Video</h1>
              </div>
            </div>
          </div>

          <div class="flex flex-col items-center md:hidden bg-white rounded-xl w-full my-2 md:w-[350px] h-full">
            <p class="px-3 py-7">
              The videos here are reworks of the ones found on the YouTube
              channel and I provide the original url. They are just presented in a
              different style here. I wanted to enjoy my favorite sailors in a less distracting environment and with a different style and feel. Please enjoy and don't forget to visit those links, like, subscribe and such.
            </p>
            <button class="border-2 border-swabbie-st-secondary rounded-lg mb-4 px-6 py-2">
              Archive
            </button>
          </div>
          <div class="md:relative my-8 z-10 lg:ml-32">
            <%= image_tag('https://milk-00.Video_Home.png', alt: "video review", class: 'border-4 border-swabbie-st-secondary rounded-lg md:absolute top-0 left-8') %>
          </div>
        </div>

        <div class="hidden md:flex justify-center md:w-1/2">
          <div class="hidden md:flex flex-col items-center bg-white rounded-xl w-[350px] h-full">
            <p class="px-3 py-7">
              The videos here are reworks of the ones found on the YouTube
              channel and I provide the original url. They are just presented in a
              different style here. I wanted to enjoy my favorite sailors in a less distracting environment and with a different style and feel. Please enjoy and don't forget to visit those links, like, subscribe and such.
            </p>
            <%= link_to "Archive", archive_salt_and_tar_index_path, class: "flex justify-center items-center h-12 w-32 mx-1 mb-4 text-swabbie-st-drk-primary bg-white border-2 border-swabbie-st-drk-primary rounded-sm font-Inconsolata drop-shadow-lg hover:drop-shadow-none" %>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

