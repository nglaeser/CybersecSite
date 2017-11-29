Noemi Glaeser  
27-Nov-2017

# Contributing
Please run `git config pull.rebase true` before commiting.
Commits that look like 'Merged branch master' are strongly discouraged.

### Modifying Head, Header, or Footer
If you modify the `<head>`, `<header>`, or `<footer>` sections of any HTML file, please make the modification in the corresponding `.txt` file located in the `static` folder:
```
static/head.txt
static/header.txt
static/footer.txt
```
This is for the purposes of consistency, and also allows for easier modification and standardization of headers in all HTML files with Vim.

# Requirements
Install Python Flask:
```
pip install flask
```

# Testing the site locally
Check python version:
```
python -V
```

Navigate to the directory where you want to spin up a server and type the following:
```
python app.py
```

You can now access the content in your browser at `localhost:5000` (5000 is the default port, but you can specify a different one by appending the port number to the above command). 

# Color codes
Garnet: `#73000a`  
Black: `#000000`
