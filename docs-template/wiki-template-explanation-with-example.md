# wiki-template-explanation-with-example

## Outline

```
# Title

conclusion of article. appeal it.

# Background

Why this is written.

# Summary

* conclusion of detail 0
* conclusion of detail 1
* ...
* conclusion of detail 5

# Detail

## conclusion of detail 0

content of conclusion of detail 0

## conclusion of detail 1

content of conclusion of detail 1

## ...

## conclusion of detail 5

content of conclusion of detail 5

# Reference

* url for official support
* etc.

# Last updated

yyyy/mm/dd
```

---------

# Title

Title should be conclusion, most appeal point and "what" is detailed".

## pros.

```
How to build development environment by only command-line
```
```
How to build test environment by GUI tools and command-line
```

## cons.

```
building environment
```

* what environment is ?
* build by what ?

# Background

Background should be set "reason" or "purpose" why this article is written.

## pros.

```
To avoid "there's no text information but telling is only way to build development",

this is written.
```

## cons.

```
Everybody write, so I write.
```

# Summary

At summary, conclusions of detail are listed.

When it's hard to listing first, it's good to write detail first, summarize them and make list.

## pros.

```
* install abc by zxv.
* install cdb by jkl.
* change settings of cdb.
```

## cons.

```
* install abc by zxv
  * at install, run command {install command}
  * after {install command}, check return code ...
...
```

At summary, detail should not be shown. They are put on "detail" paragraph.

# detail

In detail paragraph, it backups summary with "detail" info; i.e.) sample code, operation sequence, image

## pros.

```
### install abc by zxv

run below command
$ {install command}
// check return command should be 0

### install cdb by jkl

run below command
$ {install command}
// check return command should be 0

### change logger settings of cdb

open cdb's config by editor
$ YOUR_EDITOR /path/to/cdb/config/user.cfg

Near Line 10
# AUTO_AUTHN=TRUE
# AUTO_RUN=TRUE


remove sharp comment
# AUTO_AUTHN=TRUE
AUTO_RUN=TRUE
```

## cons.

```
run {install command}
run {install command}
change logger settings of cdb with /path/to/cdb/config/user.cfg
```

no sample code, any operation flows

# reference

At the end, to notice reader some info,

append reference with url or etc.

## pros.

```
* [Official command reference of abc](http://example.com)
* etc.
```

## cons.

```
* Please email if any question about introduced 3rd party tools.
```

# Last updated

Update when revised.

## pros.

update.

## cons.

not written.
