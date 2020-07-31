使用git clone url导出项目后、
修改 .git/config文件


[core]
   repositoryformatversion = 0
   filemode = false
   bare = false
   logallrefupdates = true
   symlinks = false
   ignorecase = true
[submodule]
   active = .
[remote "origin"]
   url = https://gitee.com/stylesmile/snow.git
   fetch = +refs/heads/*:refs/remotes/origin/*
   url = https://github.com/stylesmile/snow.git
   
[branch "master"]
   remote = origin
   merge = refs/heads/master
   
[remote "github"]
    url = https://github.com/stylesmile/snow.git
    fetch = +refs/heads/*:refs/remotes/gitee/*
    tagopt = --no-tags