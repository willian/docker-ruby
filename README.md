[willian/ruby](https://hub.docker.com/r/willian/ruby)
==================

Base docker image to run **Ruby** applications in [`azk`](http://azk.io)

Versions (tags)
---

<versions>
- [`2.2-node12-qt`](https://github.com/willian/docker-ruby/blob/master/2.2-node12-qt/Dockerfile)
</versions>

Image content:
---

- Ubuntu 14.04
- Git
- VIM
- NodeJS
- npm
- Ruby
- Bundle
- ImageMagick
- QT

Database:

- PostgreSQL client
- MySQL client
- MongoDB
- SQLite3

### Usage with `azk`

Example of using this image with [azk](http://azk.io):

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  "my-app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "willian/ruby:2.2-node12-qt"},
    // Steps to execute before running instances
    provision: [
      "bundle install --path /azk/bundler"//,
      // "rake db:create",
      // "rake db:migrate"
    ],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "bundle exec rackup config.ru --pid /tmp/ruby.pid --port $HTTP_PORT --host 0.0.0.0",
    wait: {"retry": 20, "timeout": 1000},
    mounts  : {
      '/azk/#{manifest.dir}': path('.'),
      '/azk/bundler'        : persistent('bundler'),
    },
    scalable: {"default": 1},
    http: {
      // my-app.dev.azk.io
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    envs: {
      // set instances variables
      RACK_ENV : 'development',
      BUNDLE_APP_CONFIG : '/azk/bundler',
    }
  },
});
```

Logs
---

```sh
# with azk
$ azk logs my-app
```
