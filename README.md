This is my little (and hopefully growing) collection of TeX classes I use.

# article
This class is based on koma-scrips scrartcl. I mainly used it for my bachelors thesis so it's kinda tailored to this.
### Options
This class provides some settings you can tweak:
- Language: Possible values are `english` or `german`. This changes the value passed to babel and csquotes. If none of both is selected, `german` is used.

Look at ![example.pdf](https://github.com/LukasPietzschmann/tex-classes/blob/master/article/example.pdf) to see an example document and at
![example.tex](https://github.com/LukasPietzschmann/tex-classes/blob/master/article/example.tex) to see how it was made.

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

## Related stuff
If you're looking for a beamer theme in the same style as the classes here, you may want to take a look at [awesome-beamer](https://github.com/LukasPietzschmann/awesome-beamer).
