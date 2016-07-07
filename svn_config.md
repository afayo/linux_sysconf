1.在linux中使用svn add添加并上传文件到svn的时候，*.so *.bin 等文件被忽略的问题
 两个解决办法：
  方法1： 每次添加文件的时候使用如下命令：
                 svn add  --no-ignore  文件夹

  方法2：.编辑以下任一文件（linux的svn客户端的配置文件）
        /etc/subversion/config   （针对服务器所有用户有效）
        ~/.subversion/config  （对当前用户有效，会覆盖上面“/etc/subversion/config”这个配置，而不是在上面原有的配置基础上增加）
    将文件中包含“global-ignores = ”的行，取消注释，并把这个“=”之后的字符全部删除(或者可以过滤掉*.o文件，保留也可以*.o)。要特别注意 global-ignores 前面不要留空格，
    紧挨着最前面就可以了，否则svn add的时候会出现以下错误：
               svn: /etc/subversion/config:103: Option expected    。
      保存config这个文件（保存文件之后，SVN就立即载入这个配置，然后立即就可以使用了），即可一劳永逸。永远都不会有漏传的文件了。 
      

2.svn 老是提示输入密码和用户名
解决办法：
1、查看 主目录下：~/.subversion/config 文件，找到“store-auth-creds = no”这句，看前面是否有#号注释符。 
如果没有，则或者加上#号，或者将no改为yes。
2、 查看 主目录下： ~/.subversion/auth/的目录权限，当前用户是否具有可写权限。 
    查看 主目录下： ~/.subversion/auth/svn.simple/ 目录下是否存在文件。存在的话，看文件权限是否可写。 
    不可写的，改成可写权限。
    
