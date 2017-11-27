Noemi Glaeser 

27-Nov-2017

# Testing the site locally

Check python version:
```
python -V
```

Navigate to the directory where you want to spin up a server, and based on your python version, type one of the following:
```
# If Python version returned above is 3.X
python -m http.server
# If Python version returned above is 2.X
python -m SimpleHTTPServer
```

You can now access the content in your browser at `localhost:8000` (8000 is the default port, but you can specify a different one by appending the port number to the above command). 
