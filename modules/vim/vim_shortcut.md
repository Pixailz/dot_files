# Vim shortcut

## Definition

- Ctrl key -> `<C-'lower_key'>`
- Ctrl Shift key -> `<C-'upper_key'>`
- Shift key -> `<'upper_key'>`
- Single key -> `<'lower_key'>`
- Escape key -> `<esc>`

### Copy Paste line

1. `<C-V>`
1. select line
1. `<c>` to cut
1. `<p>` to past under cursor

### Replace inside, inner

1. `<c><i>` (stand for change inside, inner)
1. input what inside character
	- (
	- {
	- [
	- "
	- '

### Replace inside, outer

1. `<c><a>` (stand for change inside, outer)
1. input what inside and the character
	- (
	- {
	- [
	- "
	- '

### Multi line, insert

1. `<C-v>`
1. select line to insert to
1. `<C-i>`
1. insert what you wan't to insert
1. `<esc>`

> have to wait a lil to see change

### Multi line, delete

1. `<C-v>`
1. select text you wan't to delete
1. `<d>`

> have to wait a lil to see change

### Repeatedly insert at the end

> insert '.txt' at the end of each line

1. `<A>` (to insert at the end)
1. input '.txt'
1. `<esc>`
1. go down with `<j>` or `<down>` or choose line to insert at the end
1. press `<.>`
	- '.' will repeat last executed command

### Go to file

1. put the cursor to a file path
1. `<g><f>`

### Sort line

1. `<C-V>` to select line
1. `<!>sort<enter>`

### Last used cursor

- `<C-o>` go back to the previous used cursor
- `<C-i>` go back to the next used cursor

### Delete line

- `<d><d>` delete the current line your on

### Copy line

- `<y><y>` copy the current line your on

### Reindent all file

- `<g><g><=><G>`

### Replace all occurence

- `:s/<from_replace>/<to_replace>/g`
	- s  -> substitute command, current line only
	- %s -> substitute command, current file only

### incrementation / decrementation

- `<C-a>` increment current number under cursor
- `<C-x>` decrement current number under cursor

### Insert at the end of line

- `<A>` to insert a the end of line, pointed by cursor
- `<I>` to insert a the begin of line, pointed by cursor
