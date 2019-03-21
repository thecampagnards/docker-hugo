thecampagnards/hugo
==============

[![Build Status](https://travis-ci.org/thecampagnards/docker-hugo.svg?branch=master)](https://travis-ci.org/thecampagnards/docker-hugo)

`thecampagnards/hugo` is a [Docker](https://cloud.docker.com/repository/registry-1.docker.io/thecampagnards/hugo) base image for static sites generated with [Hugo](http://gohugo.io).

Images derived from this image can either run as a stand-alone server, or function as a volume image for your web server.

Prerequisites
-------------

The image is based on the following directory structure:

	.
	├── Dockerfile
	└── site
	    ├── config.toml
	    ├── content
	    │   └── ...
	    ├── layouts
	    │   └── ...
	    └── static
	        └── ...

In other words, your Hugo site resides in the `site` directory, and you have a simple Dockerfile:

```dockerfile
FROM thecampagnards/hugo
```

Building your site
------------------

Based on this structure, you can easily build an image for your site:

```sh
docker build -t my/image .
```

Your site is automatically generated during this build.

Using your site
---------------

There are two options for using the image you generated:

- as a stand-alone image
- as a volume image for your webserver

Using your image as a stand-alone image is the easiest:

```sh
docker run -p 1313:1313 my/image
```

This will automatically start `hugo server`, and your blog is now available on <http://localhost:1313>.