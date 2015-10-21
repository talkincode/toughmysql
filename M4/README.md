## mysql主从复制

### 创建并启动主数据库 192.168.0.10


    `$ docker run --name mysql-master -d -p 3306:3306 \
        -v /home/var/lib/mysql:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=myroot MYSQL_ROLE=master talkincode/docker-mysql:M4`
        
        
### 创建并启动从数据库 192.168.0.11


    `$ docker run --name mysql-slave -d -p 3306:3306 \
        -v /home/var/lib/mysql:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=myroot MYSQL_ROLE=slave talkincode/docker-mysql:M4`
        
        
### 连接主库，并运行以下命令，创建一个用户用来同步数据

    $ mysql -h 192.168.0.10 -uroot -p myroot
    
    $ mysql > GRANT REPLICATION SLAVE ON *.* to 'backup'@'%' identified by '123456';

### 查看主库状态

    $ show master status;
    
    mysql-bin.000004、312
    
记住File、Position的值，如果没查到数据，请检查第一、第二步，配置问题。 


### 连接到从库，运行以下命令，设置主库链接

    $ change master to master_host='192.168.0.11',master_user='backup',master_password='123456',
    master_log_file='mysql-bin.000004',master_log_pos=312,master_port=3306;
    
### 启动同步

    $ start slave;
    
### 查看同步状态

    $ show slave status
    
如果看到Waiting for master send event.. 什么的就成功了，你现在在主库上的修改，都会同步到从库上