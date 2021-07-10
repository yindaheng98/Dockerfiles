# cron

用容器运行`cron`定时脚本，基于`ubuntu:focal`

## 使用方法

单个任务：

```sh
docker run --rm -it -e CRON_RUNTIME_1='* * * * *' -e CRON_COMMAND_1="echo it\'s \$(date) now, I\'m a little cron job 1." yindaheng98/cron
```

每个cron任务各指定一个时间：

```sh
docker run --rm -it \
    -e CRON_RUNTIME_1='* * * * *' \
    -e CRON_COMMAND_1="echo it\'s \$(date) now, I\'m a little cron job 1." \
    -e CRON_RUNTIME_2='30 * * * *' \
    -e CRON_COMMAND_2="echo it\'s \$(date) now, I\'m a little cron job 2." \
    -e CRON_RUNTIME_ABC='* 2 * * *' \
    -e CRON_COMMAND_ABC="echo it\'s \$(date) now, I\'m a little cron job ABC." \
    yindaheng98/cron
```

多个任务在同一个时间做：

```sh
docker run --rm -it \
    -e DEFAULT_CRON_RUNTIME='* * * * *' \
    -e CRON_COMMAND_1="echo it\'s \$(date) now, I\'m a little cron job 1." \
    -e CRON_COMMAND_2="echo it\'s \$(date) now, I\'m a little cron job 2." \
    -e CRON_COMMAND_ABC="echo it\'s \$(date) now, I\'m a little cron job ABC." \
    yindaheng98/cron
```

当然也可以混用：

```sh
docker run --rm -it \
    -e CRON_RUNTIME_1='* * * * *' \
    -e CRON_COMMAND_1="echo it\'s \$(date) now, I\'m a little cron job 1." \
    -e CRON_RUNTIME_2='30 * * * *' \
    -e CRON_COMMAND_2="echo it\'s \$(date) now, I\'m a little cron job 2." \
    -e CRON_RUNTIME_ABC='* 2 * * *' \
    -e CRON_COMMAND_ABC="echo it\'s \$(date) now, I\'m a little cron job ABC." \
    -e DEFAULT_CRON_RUNTIME='* * * * *' \
    -e CRON_COMMAND_DEF="echo it\'s \$(date) now, I\'m a little cron job DEF." \
    -e CRON_COMMAND_HIJ="echo it\'s \$(date) now, I\'m a little cron job HIJ." \
    yindaheng98/cron
```

所有未指定对应`CRON_RUNTIME_*`环境变量的`CRON_COMMAND`都使用`DEFAULT_CRON_RUNTIME`作为执行时间。