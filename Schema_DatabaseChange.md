# Introduction #

为避免频繁出现的不同步现象、减少无谓的调试时间，以后的数据库修改流程，建议如下。


# Details #
  1. 使用Sql管理工具修改表、触发器、视图和存储过程；
  1. 进行一系列修改后，在管理工具中选中数据库，右键选择"Tasks->Generate Scripts..."菜单，重新生成脚本；
  1. 将生成的脚本，拷贝到/database下的table\_export.sql或sp\_export.sql，并修改脚本顶部注释的更新时间和更新人