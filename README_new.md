
# Rogue Media Lab

[![Rails](https://img.shields.io/badge/rails-8.0.2-orange?logo=rubyonrails)](https://rubyonrails.org)
[![Ruby](https://img.shields.io/badge/ruby-3.3.7-red?logo=ruby)](https://www.ruby-lang.org)
[![PostgreSQL](https://img.shields.io/badge/database-PostgreSQL-blue?logo=postgresql)](https://www.postgresql.org)
[![Tailwind CSS](https://img.shields.io/badge/css-Tailwind-blue?logo=tailwindcss)](https://tailwindcss.com)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

Rogue Media Lab is a multi-faceted web application built with Rails 8. It serves as a personal portfolio, a blog, and a showcase for various conceptual web projects, all managed through a unified administrative backend.

![Home screen for Rogue Media Lab](public/Screenshot%20from%202025-11-09%2008-59-33.png)

## Core Features

This application integrates several distinct modules into a single platform:

*   **Admin Dashboard:** A secure backend (`/milk_admin`) for managing all site content, including blog posts, projects, music library, and user administration.
*   **Blog Engine:** A public-facing blog with rich text, image uploads, category filtering, and SEO-friendly URLs.
*   **Portfolio Showcase:** The application hosts several unique "concept projects," each with its own theme and functionality:
    *   **Salt and Tar:** A tribute site for a YouTube sailing channel, featuring a custom video archive.
    *   **Hermit Plus:** A concept for a Minecraft Hermitcraft fan portal.
    *   **Copywriter:** A professional copywriting service concept page.
    *   **Zuke Music:** A music library for browsing artists, albums, and genres.
*   **Digital Resume/CV:** A collection of pages detailing personal skills, project history, and a functional contact form.
*   **Authentication:** Utilizes Devise for separate administrator (`MilkAdmin`) and public user (`User`) authentication.
*   **File Storage:** Integrates with Amazon S3 for hosting images and other assets via Active Storage.

## Technical Stack

This project is built with a modern, robust set of technologies.

### Backend
*   **Framework:** Ruby on Rails 8.0.2
*   **Language:** Ruby 3.3.7
*   **Database:** PostgreSQL
*   **Background Jobs:** Solid Queue
*   **Caching:** Solid Cache
*   **Key Libraries:**
    *   `devise` for authentication
    *   `view_component` for component-based views
    *   `ransack` for search functionality
    *   `friendly_id` for clean, slug-based URLs
    *   `aws-sdk-s3` for cloud storage

### Frontend
*   **Frameworks:** Hotwire (Turbo & Stimulus)
*   **Styling:** Tailwind CSS
*   **Asset Pipeline:** Importmap & Propshaft
*   **Rich Text:** Action Text (Trix Editor)

## Getting Started

To get a local copy up and running, follow these steps.

### Prerequisites

Ensure you have the following installed on your system:
*   Ruby 3.3.7
*   Node.js (v18.x or later)
*   Yarn
*   PostgreSQL

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/your_username/milk_lab.git
    cd milk_lab
    ```

2.  **Install dependencies:**
    ```sh
    bundle install
    npm install
    ```

3.  **Set up the database:**
    *   Update `config/database.yml` with your local PostgreSQL credentials.
    *   Create, migrate, and seed the database:
    ```sh
    rails db:setup
    ```
    This will create the databases, load the schema, and populate the database with initial seed data (including an admin user if defined in `db/seeds.rb`).

4.  **Run the local server:**
    ```sh
    rails server
    ```
    The application will be available at `http://localhost:3000`.

## Usage

*   **Public Site:** Navigate to `http://localhost:3000` to view the main application.
*   **Admin Dashboard:** Log in at `http://localhost:3000/milk_admins/sign_in` to manage site content. The default credentials should be available in the `db/seeds.rb` file.

## License

This project is distributed under the MIT License. See `LICENSE` for more information.
