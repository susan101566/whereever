== README

How to set up:

# 1. install rvm on your computer. (need bash shell) 

```console
\curl$–L$https://get.rvm.io$|$bash
```

# 2. install ruby-2.0.0-p247

```console
rvm install 2.0.0-p247
```

# 3. cd into this directory. Load ruby-2.0.0-p247

```console
rvm use 2.0.0-p247
```

# 4. install ruby gems

```console
bundle install
```

# 5. initialize database, load pre-set data.

```console
rake db:create
rake db:migrate
rake db:seed
```

# 6. run app

```console
rails server
```

# 7. Go to http://127.0.0.1:3000 and you'll see this app!
