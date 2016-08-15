# Homebrew Formula for PDFtk Server

This is a [Homebrew](http://brew.sh/) formula for [PDFtk
Server](https://www.pdflabs.com/tools/pdftk-server/), the
[GPL-licensed](https://www.pdflabs.com/docs/pdftk-license/) version of
[PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/), a PDF toolkit.

## Features

From the [PDFtk Server website](https://www.pdflabs.com/tools/pdftk-server/),
PDFtk Server can:

* Merge PDF documents or collate PDF page scans
* Split PDF pages into a new document
* Rotate PDF documents or pages
* Decrypt input as necessary (password required)
* Encrypt output as desired
* Fill PDF forms with X/FDF data and/or flatten forms
* Generate FDF data stencils from PDF forms
* Apply a background watermark or a foreground stamp
* Report PDF metrics, bookmarks and metadata
* Add/update PDF bookmarks or metadata
* Attach files to PDF pages or the PDF document
* Unpack PDF attachments
* Burst a PDF document into single pages
* Uncompress and re-compress page streams
* Repair corrupted PDF (where possible)

## Installation

To install PDFtk Server, first install Homebrew by running this command at the
shell prompt:

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

See the [Homebrew installation
instructions](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Installation.md#installation)
for more information.

Then, use [`brew
tap`](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/brew-tap.md#brew-tap)
to track the
[`spl/homebrew-pdftk`](https://github.com/spl/homebrew-pdftk)
repository:

```
$ brew tap spl/pdftk
```

Finally, install the `pdftk` formula:

```
$ brew install pdftk
```

Note that this formula requires the
[`ecj`](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/ecj.rb)
(for Java) and
[`gcc`](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/gcc.rb)
(for `gcj`) formulas. By default, it requires `gcc` with the
`--with-all-languages` flag. You can pass `--with-java` to `brew install pdftk`
if you prefer to install `gcc` with only Java support (or if you already have
that version of `gcc` installed).

To confirm that installation worked:

```
$ which pdftk
/usr/local/bin/pdftk
$ pdftk --version

pdftk 2.02 a Handy Tool for Manipulating PDF Documents
Copyright (c) 2003-13 Steward and Lee, LLC - Please Visit: www.pdftk.com
This is free software; see the source code for copying conditions. There is
NO warranty, not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

## Usage

Typing `pdftk` at the shell prompt gives you a summary of commands:

```
$ pdftk
SYNOPSIS
       pdftk <input PDF files | - | PROMPT>
            [ input_pw <input PDF owner passwords | PROMPT> ]
            [ <operation> <operation arguments> ]
            [ output <output filename | - | PROMPT> ]
            [ encrypt_40bit | encrypt_128bit ]
            [ allow <permissions> ]
            [ owner_pw <owner password | PROMPT> ]
            [ user_pw <user password | PROMPT> ]
            [ flatten ] [ need_appearances ]
            [ compress | uncompress ]
            [ keep_first_id | keep_final_id ] [ drop_xfa ] [ drop_xmp ]
            [ verbose ] [ dont_ask | do_ask ]
       Where:
            <operation> may be empty, or:
            [ cat | shuffle | burst | rotate |
              generate_fdf | fill_form |
              background | multibackground |
              stamp | multistamp |
              dump_data | dump_data_utf8 |
              dump_data_fields | dump_data_fields_utf8 |
              dump_data_annots |
              update_info | update_info_utf8 |
              attach_files | unpack_files ]

       For Complete Help: pdftk --help
```

For a detailed description, refer to the man page:

```
$ man pdftk
```
