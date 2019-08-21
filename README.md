**URL Shortener Exercise**

URL shortening is a technique on the web in which a URL may be made substantially shorter and still direct to the required page.

This application should include the following:

A way to submit the URL to be shortened

After submission, display of the shortened URL

Type `ruby app.rb` to run application

The app runs on `http://localhost:4567`

To add urls to be shortened, youc an use Curl
`curl http://localhost:4567/ --data "url=google.com" -X POST`
