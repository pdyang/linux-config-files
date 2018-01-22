# Aliases definitions

# ls
alias ls='ls --color=auto -F' # 输出添加颜色, 并在尾部添加文件类型标志
alias ll='ls -lh'
alias la='ls -A' # 显示除了./ ../外的所有文件
alias ldir='ls | grep "/$"' # 只显示目录
alias lldir='ls -l | grep "^d"' # 按单列只显示目录

# rm
alias rm='rm -iv' # 提示所做的操作
alias rd='rm -r' # 递归的删除目录及其内容

# mkdir 
alias mkdir='mkdir -vp' # 创建目录(及其子目录), 并提示所做操作

# free
alias free='free -h' # 以人类易读方式显示

# cp
alias cp='cp -v' # 提示所做的操作

# mv
alias mv='mv -v'
