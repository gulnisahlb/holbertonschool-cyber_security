The login endpoint is vulnerable to user enumeration.
The application returns different error messages depending
on whether the username or the password is incorrect.
This allows an attacker to enumerate valid usernames and
indicates a weak authentication logic
