---
title: Setup
---

Please complete the following setup before attending the workshop.

### Software

Install the following software on your computer:

- **R:** Install [R](https://cran.r-project.org/) (version 4.1.0 or later).
- **RStudio:** Install [RStudio Desktop](https://posit.co/download/rstudio-desktop/).

Install R before installing RStudio. 
Both are available for Windows, macOS, and Linux.

#### Check your installation

Open RStudio and run the following command in the Console:

``` R
R.version.string
```

You should see the version of R installed on your computer.

### Equipment and access

- **Laptop:** Bring your own laptop running Windows, macOS, or Linux, with R and RStudio installed.
- **Internet access:** You will need an internet connection during the workshop.
- **Installation permissions:** Check that you can install R packages by installing `ggplot2` as described below.

#### Test package installation

To check that you can install and load an R package, run these commands one at a time in the RStudio Console:

``` R
install.packages("ggplot2")
library(ggplot2)
```

Installation prints progress messages, which vary by system.
Loading the package usually produces no output; your Console should look like this:

``` text
> library(ggplot2)
>
```

If the prompt returns without an error, you're all set!
