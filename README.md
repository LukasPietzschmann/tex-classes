This is my little (and hopefully growing) collection of TeX classes I use.

## exercise
### Options
This class provides some settings you can tweak:
- Language: Possible values are `english` or `german`. This changes the value passed to babel and csquotes. If none of both is selected, `german` is used.
- Solutions: Often you want to compile two versions of your exercise sheet: One with all solutions and one without. To do this, this class provides three different ways:
	- The environment `solution`: This is intended for longer solutions, that span more than one lines.
	- The command `\onelinesolution`: This should be used for short solutions that only span one line.
	- The command `\inlinesolution`: For even shorter solutions, this is the way to go.

`\onelinesolution` and `\inlinesolution` only differ in one small detail. The first one prints it's content in a new line, while the latter does not do this.

You can then pass the `solution` option to `\documentclass` to compile with all solutions, or by omitting
this option, your solutions are not shown.
- uulm: You can set this flag if you're studying at the University of Ulm. This puts the university's logo in the top right corner.

Look at ![example.pdf](https://github.com/LukasPietzschmann/tex-classes/blob/master/exercise/example.pdf) to see an example document and at
![example.tex](https://github.com/LukasPietzschmann/tex-classes/blob/master/exercise/example.tex) to see how it was made.

## Related stuff
If you're looking for a beamer theme in the same style as the classes here, you may want to take a look at [awesome-beamer](https://github.com/LukasPietzschmann/awesome-beamer).
