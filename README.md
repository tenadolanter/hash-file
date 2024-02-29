# hash-file

使用wasm计算文件的hash值

## 运行项目

```bash
# 安装go依赖
go mod tidy

# 打包go代码
npm run build

# 安装依赖
npm install

# 本地运行
npm run example:dev
```

## TODO issue

- [] 处理html里面加载wasm报错

- [] go向外暴露main方法，考虑向外暴露多个方法

- [] lib下考虑新增index.js，向外暴露多个方法用于处理不同类型的hash计算
