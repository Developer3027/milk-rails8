
# Unused Code and File Report

This document outlines potentially unused, commented-out, or redundant code and files found within the Rogue Media Lab application. This analysis is based on a review of controllers, helpers, and routing configurations.

## 1. Unused Routes

The following routes are defined in `config/routes.rb` but appear to be commented out, making them inactive:

-   `get "hermits/index"`
-   `get "swabbies/home"`

Additionally, the route `get "static_pages/plan"` is defined but does not correspond to any action in the `StaticPagesController`.

## 2. Unused Controller Actions

Several controllers contain actions that are not mapped to any active route in `config/routes.rb`:

-   **`HermitPlusController`**: The `index` action is defined but not routed. The `landing` action is routed as `hermits`.
-   **`StaticPagesController`**:
    -   The `show_section` action does not appear to be used by any route.
    -   The `resume` action is defined but not routed.
-   **`SwabbiesController`**: The `saltandtar` action is defined but not routed.

## 3. Commented-Out Code Blocks

Significant blocks of code have been commented out and may be candidates for removal.

-   **`BlogsController#index`**: A large block for setting meta tags is commented out. The functionality appears to be handled by the `set_meta_data` `before_action` in `ApplicationController`.
-   **`MilkAdminController`**: Multiple actions and their corresponding private `*_params` methods related to creating `Resume`, `Project`, and `Pill` objects are commented out:
    -   `admin_resume`
    -   `create_resume`
    -   `create_project`
    -   `create_pill`
    -   `resume_params`
-   **`ZukeController#genres`**: A line for handling songs without a genre is commented out:
    -   `# songs_without_genre = Song.where(genre_id: nil)`
    -   `# @grouped_genres["Unknown"] = songs_without_genre if songs_without_genre.any?`

## 4. Potentially Unused Helper Files

The following helper files exist but correspond to controllers or models that are either not in use or have no complex view logic requiring them. They are currently empty modules.

-   `app/helpers/hermits_helper.rb` (corresponds to `HermitPlusController`, not `HermitsController`)
-   `app/helpers/pills_helper.rb`
-   `app/helpers/projects_helper.rb`
-   `app/helpers/resumes_helper.rb`

## 5. Redundant Controller Action

-   **`StaticPagesController#create_contact`**: This action appears to be redundant. The `InfoController#create_contact` action handles the creation of `Contact` objects from the `/info/contact` form, and the `static_pages#contact` route points to `static_pages#create_contact`, which may cause confusion.

---
*This report is intended for review purposes. It is recommended to verify the status of each item before removal to ensure no application functionality is broken.*
