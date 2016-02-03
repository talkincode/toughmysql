# docker-mysql
[![](https://badge.imagelayers.io/talkincode/docker-mysql:latest.svg)](https://imagelayers.io/?images=talkincode/docker-mysql:latest 'Get your own badge on imagelayers.io')

快速安装: 

    $ wget https://github.com/talkincode/toughmysql/raw/master/tmshell -O /usr/local/bin/tmshell

    $ chmod +x /usr/local/bin/tmshell

    $ tmshell install
     

指令参考：

    $ tmshell help      

    usage: tmshell [OPTIONS] instance

    docker_setup                install docker, docker-compose
    pull                        mysql docker images pull
    install                     install default mysql instance
    remove                      uninstall mysql instance
    config                      mysql instance config edit
    status                      mysql instance status
    restart                     mysql instance restart
    stop                        mysql instance stop
    logs                        mysql instance logs
    showmaster                  mysql instance show master status
    showslave                   mysql instance show slave status
    upmaster                    mysql instance update master sync config
    backup                      mysql instance backup database
    dsh                         mysql instance bash term

    All other options are passed to the tmshell program.
     
