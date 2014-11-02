### gitcheck.rb

* description

will find particular word and where is that.

(word; you never want to commit such like 'binding.pry')

* requirements

should be run the directory placed .git

* settings

In gitcheck.rb src, line 9, allocate string element of array to @illegalWord (default is ['foo'])

If don't want to commits 'binding.pry', do this

```
at line 9
9 @illegalWord = ['binding.pry']
```

* ex

```ruby:app/controllers/top_controller
...
app/controllers/top_controller
8 def index
9   binding.pry   　 # inserted to src
10  @user = User.all # inserted to src
11 end
...

gitcheck (under app/)
==> illegal word 'binding.pry' at app/controllers/top_controller.rb:9

```

* known bug

1. checks valid only before commits.

After commits, check will no use.

2. unknown (If find, tell me plz)

ex 1.
```ruby:app/controllers/top_controller
...
app/controllers/top_controller
8 def index
9  binding.pry       # inserted to src
10  @user = User.all # inserted to src
11 end
...
git add . (att app/)
gitcheck.rb (under app/)
==> illegal word 'binding.pry' at app/controllers/top_controller.rb:9

git commit -m 'Im all right there is NO binding!'
gitcheck.rb (under app/)

app/controllers/top_controller.rb
9  binding.pry       # inserted to src
ooooops!!!
```

===

### findext.rb

* description

find file with particular extension and stdout.

* settings and requirements

nothing

* option

-l list

-s sort

-ls(or -sl) sorted list

* known bug

1. known bug is unknown (if find, plz tell me)

* ex
```
mumble/

      | --- foo.txt

      | --- bar.txt

      | --- baz.dat

      / qux / --- oof.dat

            | --- ofo.txt

            | --- oo.dat
```

at mumble/

```
findext txt
./qux/ofo.txt ./bar.txt ./foo.txt

findext -l txt
./qux/ofo.txt
./bar.txt
./foo.txt

findext -s txt
./bar.txt ./foo.txt ./qux/ofo.txt

findext -sl txt
./bar.txt
./foo.txt
./qux/ofo.txt
```
