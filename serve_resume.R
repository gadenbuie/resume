#!/usr/bin/env Rscript

missing_hackmyresume <- system("hackmyresume -h", ignore.stdout=TRUE, ignore.stderr=TRUE)
if (missing_hackmyresume) {
  stop("hackmyresume is not installed.\nTry `[sudo] npm install -g hackmyresume`\nOr visit https://github.com/hacksalot/HackMyResume")
}

if (!"package-lock.json" %in% dir("theme/dave-alt/"))
  stop("Please run `npm install` in `theme/dave-alt/`")

require(servr)

has_index <- "index.html" %in% dir()
if (!has_index)
  system("hackmyresume build resume.json TO index.html -t ./theme/dave-alt/")

rebuild <- function(x) {
  if (x == "resume.json")
    system("hackmyresume build resume.json TO index.html -t ./theme/dave-alt/")
}

httw(handler = rebuild, pattern = "resume.json")
