# Demo - Terraform Module Releaser

This repository demonstrates how to use the [Terraform Module Releaser](https://github.com/techpivot/terraform-module-releaser) GitHub Action to automatically release Terraform modules and update the wiki with module information.

> [!NOTE]
> Included in the repository we have some simple Terraform modules and some example workflow configurations, just to get you started.

## Cool things this will do for us

- Automatically release Terraform modules based on commit messages to GitHub releases, using smart versioning (major, minor, patch) based on commit keywords.
- Update the GitHub wiki with module information, including usage examples, terraform-docs output, and a full changelog for each module.
- Only includes the relevant module directory content in releases, improving Terraform performance and keeping releases clean.
- Removes tags from deleted modules automatically, keeping your repository organized.
- Works out-of-the-box with sensible defaults, but is highly configurable for custom workflows (e.g., exclude patterns, custom keywords, SSH/HTTPS source links).
- The action provides some useful outputs, such as `all-modules-map` (a JSON object mapping all module names to their details including path, latest tag, and latest tag version) that can help with further automation.

# Quickstart on Terraform Module Releaser

1. Go to your repository's homepage.

2. Navigate to the Settings tab.

3. Under the Features section, ensure the Wikis option is checked to enable the GitHub Wiki.

4. Navigate to the Wiki tab on your repository.

5. Click the Create the first page button and add a basic title like Home to initialize the wiki with an initial commit.

6. Save the changes to ensure your wiki is not empty when the GitHub Action updates it with module information.

7. Create the `.github/workflows` directory and add the folowing YAML file to it [`.github/workflows/terraform-module-releaser.yml`](.github/workflows/terraform-module-releaser.yml). This file contains the workflow configuration for the Terraform Module Releaser GitHub Action. The workflow is triggered on push events to the main branch and runs the action to release the Terraform modules and update the wiki with module information.

8. Create some modules and commit them to a feature branch. Make sure to follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) format for commit messages, as the action uses this format to determine the version bump type (major, minor, or patch) based on the commit messages. You can overrite keywords in the workflow file to use your own keywords, or add additional ones.

9. Push the feature branch to your repository.

10. Create a pull request to merge the feature branch into the main branch. The workflow will automatically run on the pull request, and if successful, it will showcase what will be released when the pull request is merged on a comment on the pull request.

11. Once the pull request is merged, the workflow will run again on the main branch, releasing the Terraform modules and updating the wiki with module information.

12. Navigate to the Wiki tab on your repository to see the updated module information.

# Additional Notes

- The workflow [`.github/workflows/terraform-validate.yml`](.github/workflows/terraform-validate.yml) is a simple example of how to validate the Terraform modules using the `init`, `fmt`, and `validate` commands. This workflow is triggered on pull requests and push events to the main branch, ensuring that the Terraform modules are valid before merging changes. I would recommend extending this workflow to include [`tflint`](https://github.com/terraform-linters/tflint) and [`terrascan`](https://github.com/tenable/terrascan) for security and best practices checks.
- The [`.github/dependabot.yml`](.github/dependabot.yml) file is a simple example of how to configure Dependabot to automatically check for updates to the Terraform modules and create pull requests for any updates. This file is configured to check for updates to the Terraform modules every week, but you can adjust the schedule as needed.
