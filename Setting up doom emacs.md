# First download scoop and it's bucket

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop bucket add extras
```

# Then download emacs, fd and ripgrep from scoop

```
scoop install emacs fd ripgrep
```

# Then install doom emacs

```bash
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
cd ~/.emacs.d/bin
./doom install
./doom sync
```

# Permanently add `C:\Users\shiro\.emacs.d\bin` to your User `PATH`

```
$homeBin = "C:\Users\shiro\.emacs.d\bin"
$old = [Environment]::GetEnvironmentVariable("Path","User")
if (-not ($old -split ';' | Where-Object { $_ -eq $homeBin })) {
  [Environment]::SetEnvironmentVariable("Path", ($old + ";" + $homeBin).TrimEnd(';'), "User")
  "Added $homeBin to User Path"
} else {
  "Path already contains $homeBin"
}
```

# Permanently set `HOME` to `C:\Users\shiro` (so Emacs uses your Doom config)

```
[Environment]::SetEnvironmentVariable("HOME", "C:\Users\hiro" -replace "hiro","shiro", "User")
# or directly
[Environment]::SetEnvironmentVariable("HOME", "C:\Users\shiro", "User")
"HOME set to: " + [Environment]::GetEnvironmentVariable("HOME","User")
```
