## Park EZ API

This is solely a REST API. The [android app][] talks to this.

We are using [PostgresSQL][] with [PostGIS extensions][] for better geospatial indexing and querying capabilities.

The query used to find the closest parking spot, and the code to add the index for fast lookup were borrowed from [this blog](http://ngauthier.com/2013/08/postgis-and-rails-a-simple-approach.html).

## Development

### Bootstrapping your development environment

#### OSX and Windows Users

Docker depends on low-level functionality within the Linux kernel, and it does not work natively on Windows or Mac OSX. Fear not, [docker toolbox](https://www.docker.com/products/docker-toolbox) provides a seamless experience via a virtual machine. Install that and everything should be smooth sailing from there.


Ruby is obviously needed. I recommend [rvm][] for managing ruby versions.

So that people don't have to spend time installing stuff I dockerized the
app itself.

Download [docker][] and [docker-compose][]. The choice to use docker was that it just works and is easily replicated. Only one person should need to spend time setting things up like this.

Once you have done this:

simply type (or copy/paste):

```bash
$ docker-compose build web && docker-compose up -d
```

If running the rails server outside of docker and/or Heroku (both of these take care of this detail): 

Copy `.env.example` to `.env` and add the ip or hostname of the development postgres server. **DO NOT** store this in Git. For now, nothing sensitive is in it, but that may change.

Then just work as you would.

[android app]: https://github.com/CUNYTech/ParkEZ-Android
[docker]: https://docs.docker.com/engine/installation/linux/ubuntulinux/
[docker-compose]: https://docs.docker.com/compose/install/
[rvm]: http://rvm.io/rvm/install
[PostgresSQL]: http://www.postgresql.org
[PostGIS extensions]: http://postgis.net/install/
