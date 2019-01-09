# RecommendationMovie
整个影视推荐系统由三部分构成，业务模块、存储模块、推荐引擎模块。
整个系统可以理解为有两个单独的项目构成，网站系统、推荐系统，这个两个项目使用同一个存储模块，实现数据交换功能。
业务层和存储模块层构成了本项目，也就是网站系统部分[白天运行]
推荐引擎和存储模块构成了另一个项目，推荐系统部分[晚上运行]
 
就这样实现了推荐系统
 
### 推荐系统的 构架图
![系统架构图]( https://github.com/BuleAnt/RepositoryResources/raw/master/image/RecommendationMovie/XiTongJieGou.png)
### 推荐系统的 功能图
![系统功能图](https://github.com/BuleAnt/RepositoryResources/raw/master/image/RecommendationMovie/jie_gou_she_ji.png)
### 推荐系统的 流程图
![系统流程图](https://github.com/BuleAnt/RepositoryResources/raw/master/image/RecommendationMovie/liu_cheng_tu.png)



github中README.md关联图片的图片地址的格式如下：

https://github.com/用户名/repository仓库名/raw/分支名master/图片文件夹名称/***.png or***.jpg

### 注意：
此项目仅仅实现了推荐系统的 业务模块和存储模块，推荐引擎模块，并不在此项目中。

推荐引擎 请参考 我的另一个项目： [推荐引擎Spark实现](https://github.com/FourSpaces/RecommendedSystem)

这两个项目并非 完美契合，需要大家根据自己的需求改动，才能构成一个完美的推荐系统

主要修改的部分为：

    推荐引擎项目中的 数据导入部分，数据导出部分。
    
    将数据格式修改为推荐引擎所需要的格式，即可运行，实现推荐

### 工具推荐：
使用 sqoop 工具 进行 mysql 与 hdfs, hive 进行数据导入与导出

### 部署调试：
- 导入数据库：
  将 movie_system.sql 导入MySql数据库中。
 
- 修改配置文件：
   找到 RecommendationMovie/src/main/resources/project.properties 文件，修改数据库信息为你自己的数据库信息。

