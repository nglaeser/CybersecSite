# General
Please run `git config pull.rebase true` before commiting.
Commits that look like 'Merged branch master' are strongly discouraged.

# Modifying Head, Header, or Footer
If you modify the `<head>`, `<header>`, or `<footer>` sections of any HTML file,
please make the modification in the corresponding `.txt` file located in the `static` folder:

```
static/head.txt
static/header.txt
static/footer.txt
```
This is for the purposes of consistency, and also allows for easier modification and standardization of headers in all HTML files with Vim.

