# cron

用容器运行`cron`定时脚本

* `yindaheng98/cron:ubuntu`基于`ubuntu:focal`
* `yindaheng98/cron:alpine`基于`alpine`

## 使用方法

```sh
docker run --rm -it \
    -e CRON_RUNTIME='* * * * *' \
    -e CRON_COMMAND="echo it\'s \$(date) now, I\'m a little cron job." \
    yindaheng98/cron
```