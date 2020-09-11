# tiddlywikistaticsitegen
a static blog generator using tiddlywiki


Theme uses CSS and JS from the bootstrap theme [clean blog](https://startbootstrap.github.io/startbootstrap-clean-blog/index.html)

Abbreviated instructions:  (blog posts coming soon-ish)

These instructions assume a minimal working knowledge of Docker, docker-compose, bash, and tiddlywiki.

Download and extract files from this repo.

Build image with `docker build -t twstatic .`.

Then run docker-compose.

`docker exec -it -u root tiddlyserver /bin/bash` into container.

change user: `su nodeuser`

Initialize node server: `tiddlywiki ./myblog --init server`

`cp -r ./twassets/* myblog/`

Should have directory with tiddlers, output, scripts and tiddlywiki.info with `owner:group` `nodeuser:nodeuser`

`vim tiddlywiki.info` and add markdown plugin (optional)

Change username and password: `vim twstaticup.sh`

`/bin/bash twstaticup.sh`  and `less twserverup.out` to check for errors.

Go to yoursite:8080

import default header images and tag `header-img` if you want to change.
* rename file before upload `index-bg.jpg` for index pages
* rename file `default-post.jpg` for post pages

Create drafts and posts

run `/bin/bash build.sh`  An error message will show and can be ignored if they are no image files to by moved.

check output
* images go to folder in images/year-created/month-created/image.jpg and are deleted from tiddler directory
    * meta file is retained with uri that points to image
* output dir should contain uri.html and index.html and static.css along with images and js directories.

run `/bin/bash httpserver.sh`  check httpserver.out for errors.

go to yoursite:8081 for results.

Continue to make changes, run build.sh, and refresh yoursite:8081 to check for changes.
* TIP: for minor css style changes you can go to 'inspect' in chrome or it's equivalent and change the classes and styles like colors, margins, padding, etc to get a temporary look at what they produce then add that to your code.

transferring and running the production version from a webserver like nginx with ssl certs is a post for another day.

The code for my personal site is on [github](https://github.com/digitalap3/myblog)
