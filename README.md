# NCISTSAutoUpload![shell](https://img.shields.io/badge/Shell-Bash-blue)

作者：[Cassius0924](https://www.github.com/Cassius0924)

Git仓库：[NCISTSAutoUpload](https://www.github.com/Cassius0924/NCISTSAutoUpload)



## 1. NCISTSAutoUpload是什么

NCISTSAutoUpload是一个基于Bash语言的自动化脚本，仅适用于[www.ncists.top](http://ncists.top)网站自动上传作业文件。



## 2. 环境配置

### 2.1 Linux和MacOS

安装curl即可。

- **Linux**

  ```shell
  apt install curl
  ```

  

- **MacOS**

  ```shell
  brew install curl
  ```

  

### 2.2 Windows

自己去安装cygwin或其他可以在Windows平台上运行的**类UNIX**模拟环境，然后安装curl。



## 3. 安装

```shell
git clone https://github.com/Cassius0924/NCISTSAutoUpload.git
```



## 4. 运行

### 4.1 文件准备

- **文件位置要求**

  > 必须将**代码文件**和**作业文件**放在同一文件夹下。
  >
  > 建议**单独新建**一个文件夹用于存放。

- **文件命名要求**

  > 图片需要为***.jpg***格式，命名格式为***<u>img01.jpg</u>***
  >
  > 代码文件需要为***.java***格式，命名格式为***<u>zy01.java</u>***



### 4.2 上传文件至网站的最新作业

```shell
bash NCISTSAutoUpload
```

> 运行命令后按照提示输入**用户名**与**密码**，例如：
> 用户名：李华
> 密码：12345678



### 4.3 删除网站的最新作业的所有题目的文件

```shell
bash NCISTSAutoUpload -d
```

>  运行命令后按照提示输入用户名与密码



## 5. 其他命令

> 作业文件指代码文件和图片文件

### 5.1 记住用户名与密码

```shell
bash NCISTSAutoUpload -r [用户名] [密码]
```



### 5.2 上传文件至作业中某一到题

```shell
bash NCISTSAutoUpload [题号]
```



### 5.3 删除作业中某一道题的文件

```shell
bash NCISTSAutoUpload -d [题号]
```



### 5.4 删除文件夹下的所有作业文件

请确保文件夹下无其他非作业文件，否则可能导致**误删**！

```shell
bash NCISTSAutoUpload -D
```



### 5.5 自动重命名图片文件

此命令会按照图片文件的**修改时间顺序**依次重命名，因此请确保时间顺序无误后再使用此命令。

> 检查方法：
>
> 将文件夹文件排序改为“修改时间正序排序”，从上到下检查图片文件是否依次对应第一题到最后一题

```shell
bash NCISTSAutoUpload -n
```



### 5.6 查看网站上最新作业

```shell
bash 
```





<hr>

<s>服了老鞠，网站都不能批量上传作业，不能批量上传就算了，还限制了上传的图片的格式。</s>

<s>气死我了😤，给你一拳。</s>



[https:// www.github.com/Cassius0924]: 
[www.github.com/Cassius0924]: 
