# qiwen cloud docker

## 使用docker 运行奇文网盘

```
# 同步子模块 （奇文网盘源代码）
git submodule update --init --recursive
# 启动
docker-compose up -d
# 停止
docker-compose down -v
```
