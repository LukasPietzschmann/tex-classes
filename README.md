This is my little (and hopefully growing) collection of TeX classes I use.

# General Infos
- You also need `colors.sty` in the same directory as the `.cls` file

# thesis
This class is based on koma-scrips scrartcl.
### Options
This class provides some settings you can tweak:
- Language: Possible values are `english` or `german`. This changes the value passed to babel and csquotes. If none of both is selected, `german` is used.
- Notes: This class provides the `note` macro which typesets it's argument as a footnote. You can pass `sidenote` to the class if you prefer your notes on the right margin.
- Minted style: You can make minted (pygments) use the same colors as this class does. In order to do this, pass `awesomeminted` to the class and follow the instructions in [pygments_style/README.md](https://github.com/LukasPietzschmann/tex-classes/tree/master/pygments_style/README.md).

Look at ![example.pdf](https://github.com/LukasPietzschmann/tex-classes/blob/master/thesis/example.pdf) to see an example document and at
![example.tex](https://github.com/LukasPietzschmann/tex-classes/blob/master/thesis/example.tex) to see how it was made.

# report
This class is based on koma-scrips scrartcl.
### Options
This class provides some settings you can tweak:
- Language: Possible values are `english` or `german`. This changes the value passed to babel and csquotes. If none of both is selected, `german` is used.
- Minted style: You can make minted (pygments) use the same colors as this class does. In order to do this, pass `awesomeminted` to the class and follow the instructions in [pygments_style/README.md](https://github.com/LukasPietzschmann/tex-classes/tree/master/pygments_style/README.md).
- Abstract: If you don't want your abstract to be typset in the two-column-layout, pass the option `wideabstract` to the class. This makes the abstract span both columns.

Look at ![example.pdf](https://github.com/LukasPietzschmann/tex-classes/blob/master/report/example.pdf) to see an example document and at
![example.tex](https://github.com/LukasPietzschmann/tex-classes/blob/master/report/example.tex) to see how it was made.

# exercise
This class is pretty loosely based on koma-scrips scrartcl. I tried to make it look friendly, so the exercises on it can be even more evil ;)
### Options
This class provides some settings you can tweak:
- Language: Possible values are `english` or `german`. This changes the value passed to babel and csquotes. If none of both is selected, `german` is used.
- Solutions: Often you want to compile two versions of your exercise sheet: One with all solutions and one without. To do this, this class provides three different ways:
	- The environment `solution`: This is intended for longer solutions, that span more than one lines.
	- The command `\onelinesolution`: This should be used for short solutions that only span one line.
	- The command `\inlinesolution`: For even shorter solutions, this is the way to go.
- To indicate a solution, a pencil emoji is used. Depending on your font your pencil emoji might be rotated differently than mine. You can use the following settings to correct the rotation:
	- `leftrotatecmd`, `rightrotatecmd`: They control the rotation of the left and right pencil for the `\onelinesolution` and `inlinesolution` commands.
	- `leftrotateenv`, `rightrotateenv`: They control the rotation of the upper and lower pencil of the `solution` environment.

`\onelinesolution` and `\inlinesolution` only differ in one small detail. The first one prints it's content in a new line, while the latter does not do this.

You can then pass the `solution` option to `\documentclass` to compile with all solutions, or by omitting
this option, your solutions are not shown.
- uulm: You can set this flag if you're studying at the University of Ulm. This puts the university's logo in the top right corner.

Look at ![example.pdf](https://github.com/LukasPietzschmann/tex-classes/blob/master/exercise/example.pdf) to see an example document and at
![example.tex](https://github.com/LukasPietzschmann/tex-classes/blob/master/exercise/example.tex) to see how it was made.

# cheatsheet
This class is also loosely based on koma-scrips scrartcl. But I pretty much ignore Markus Kohms pretty margins by punching them in the face
width `geometry`.
### Options
This class provides some settings you can tweak:
- Language: Possible values are `english` or `german`. This changes the value passed to babel and csquotes. If none of both is selected, `german` is used.
- Columns: You can set the `columns` key to a number n. This will partition your content into n columns. The default is 3. I definitely would not recommend anything over 4.
- Unbalanced: All columns can either be balanced or unbalanced. The former being the default. Just use `unbalanced` if your wanna fill up one column before the others get touched.

Look at ![example.pdf](https://github.com/LukasPietzschmann/tex-classes/blob/master/cheatsheet/example.pdf) to see an example document and at
![example.tex](https://github.com/LukasPietzschmann/tex-classes/blob/master/cheatsheet/example.tex) to see how it was made.

# Related stuff
If you're looking for a beamer theme in the same style as the classes here, you may want to take a look at [awesome-beamer](https://github.com/LukasPietzschmann/awesome-beamer).
