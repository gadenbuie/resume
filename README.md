# Garrick Aden-Buie's Resume

## Setup

Requires [hackmyresume](https://github.com/hacksalot/HackMyResume), installed via

```
sudo npm install -g hackmyresume
```

Uses my [jsonresume theme dave-alt](https://github.com/gadenbuie/jsonresume-theme-dave-alt), which is a fork of [kneeki/jsonresume-theme-Dave](https://github.com/kneeki/jsonresume-theme-Dave).
Before building the resume `npm install` inside `theme/dave-alt/`.

Build everything with

```
hackmyresume build resume.json TO index.html -t theme/dave-alt
```

For PDF version, I've found it's best to use Safari and print to PDF.
The next best option is to use `wkhtmltopdf`.
