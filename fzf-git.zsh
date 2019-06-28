# GIT heart FZF
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

gf_() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --bind up:preview-up,down:preview-down \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; bat --color=always {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

gv_() {
  is_in_git_repo || return
  git branch -a --color=always | rg -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --bind up:preview-up,down:preview-down \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

gt_() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --bind up:preview-up,down:preview-down \
    --preview 'git show --color=always {} | head -'$LINES
}

gg_() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd%C(reset) %h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --bind up:preview-up,down:preview-down \
    --preview 'rg -w -o "[a-f0-9]{7,}" <<< {} | xargs git show --color=always | head -'$LINES |
  rg -w -o "[a-f0-9]{7,}"
}

gr_() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --bind up:preview-up,down:preview-down \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g${c}_ | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f v t r g
unset -f bind-git-helper
