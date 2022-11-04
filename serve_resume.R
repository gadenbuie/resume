#!/usr/bin/env Rscript

"usage: serve_resume.R [--resume <resume> --host <host>]

options:
--resume <resume> resume.json file
--host <host>     Host
" -> doc
library(docopt)
library(glue)
opts <- docopt(doc)
host <- if (!is.null(opts$host)) opts$host else "127.0.0.1"
resume <- if (!is.null(opts$resume)) opts$resume else "resume.json"
hackmyresume_bin <- file.path("node_modules", ".bin", "hackmyresume")

missing_hackmyresume <- system(paste(hackmyresume_bin, "-h"), ignore.stdout=TRUE, ignore.stderr=TRUE)
if (missing_hackmyresume) {
  stop("hackmyresume is not installed.\nTry `[sudo] npm install -g hackmyresume`\nOr visit https://github.com/hacksalot/HackMyResume")
}

if (!"package-lock.json" %in% dir("theme/dave-alt/"))
  stop("Please run `npm install` in `theme/dave-alt/`")

require(servr)

has_index <- "index.html" %in% dir()
if (!has_index)
  system(glue("{hackmyresume_bin} build {resume} TO index.html -t ./theme/dave-alt/"))

rebuild <- function(x) {
  if (x == resume)
    system(glue("{hackmyresume_bin} build {resume} TO index.html -t ./theme/dave-alt/"))
}

httw(handler = rebuild, pattern = resume, host = host)
