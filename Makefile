all: resume cover

resume: index.html

txt: resume.json
	node_modules/.bin/hackmyresume build resume.json TO resume.txt

index.html: resume.json
	node_modules/.bin/hackmyresume build resume.json TO index.html -t ./theme/dave-alt/

cover: cover-letter.pdf

cover-letter.pdf: cover-letter.Rmd cover-letter.template
	Rscript -e "rmarkdown::render('cover-letter.Rmd')"

pdf: resume
	@open index.html -a safari
	@echo "I opened index.html in Safari, just print to PDF."

serve: resume
	@open "http://127.0.0.1:4321" -a safari
	./serve_resume.R
