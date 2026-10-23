# Good Practices with R

**Status: Work in Progress**

This repository contains teaching materials for the **Good Practices with R** workshop, developed using [The Carpentries Workbench](https://carpentries.github.io/sandpaper-docs/).

> **Note:** This workshop is currently under development. Lessons, exercises, and supporting materials may be incomplete or subject to change.

## For contributors and developers

The following instructions are intended for contributors and developers who want to edit the workshop materials, build the website locally, or preview changes before submitting them.

If you are attending the workshop or using the lessons for self-paced learning, you do not need to follow these steps.

### Build the workshop locally

The workshop website is built using [The Carpentries Workbench](https://carpentries.github.io/sandpaper-docs/).

To set up a local development environment, follow the steps below.

#### 1. Clone the repository

Clone the repository to your computer:

```bash
git clone https://github.com/UCL-ARC/r-intermediate-good-practices.git
cd r-intermediate-good-practices
```

#### 2. Install the required packages

Install the required Carpentries Workbench packages from The Carpentries R-universe repository:

```R
install.packages(
  c("sandpaper", "varnish", "pegboard"),
  repos = c("https://carpentries.r-universe.dev/", getOption("repos"))
)
```

#### 3. Test the installation

Run the following commands in R to check that the Workbench is installed correctly and can build a lesson:

```R
rmarkdown::pandoc_version()
tmp <- tempfile()
sandpaper::no_package_cache()
sandpaper::create_lesson(tmp, open = FALSE)
sandpaper::build_lesson(tmp, preview = FALSE, quiet = TRUE)
fs::dir_tree(tmp, recurse = 1)
```

If the installation is successful, the output should look similar to:

```text
[1] '3.9'
ℹ Consent for package cache revoked. Use `use_package_cache()` to undo.
→ Creating Lesson in '/tmp/RtmpnRjHyr/file12f34734be05f'...
✔ First episode created in '/tmp/RtmpnRjHyr/file12f34734be05f/episodes/01-introduction.Rmd'
ℹ Workflows up-to-date!
✔ Lesson successfully created in '/tmp/RtmpnRjHyr/file12f34734be05f'
/tmp/RtmpnRjHyr/file12f34734be05f
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE.md
├── README.md
├── config.yaml
├── episodes
│   ├── 01-introduction.Rmd
│   ├── data
│   ├── fig
│   └── files
├── index.md
├── instructors
│   └── instructor-notes.md
├── learners
│   └── setup.md
├── profiles
│   └── learner-profiles.md
└── site
    ├── DESCRIPTION
    ├── README.md
    ├── _pkgdown.yaml
    ├── built
    └── docs
```

#### 4. Build the workshop website

Open the cloned repository as an RStudio project, or set your working directory to the repository folder.

Run:

```R
sandpaper::build_lesson()
```

This builds the workshop website from the lesson source files.

#### 5. Preview the website locally

To preview the website, run:

```R
sandpaper::serve()
```

Open the local URL displayed in the R console to view the workshop in your browser.
You can edit the lesson source files and rebuild the website to check your changes.
For more information about developing and maintaining lessons, see the [Carpentries Workbench documentation](https://carpentries.github.io/sandpaper-docs/).

### Contributing

This workshop is under development. 
Suggestions, corrections, and contributions are welcome.

If you find an issue or would like to suggest an improvement, please [open an issue](https://github.com/UCL-ARC/r-intermediate-good-practices/issues).

## License

See [LICENSE.md](LICENSE.md) for licensing information.