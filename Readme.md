## Readme

Nowadays scalable IoT management is a bottleneck of IoT development due to the geographically dispersed distribution, fragmented ownerships, and ever-growing population of IoT devices. To intelligently manage massive decentralized applications (dApps) in IoT usecases, Edgence (EDGe + intelligENCE) uses edge clouds to access IoT devices and users, and then uses its in-built blockchain to realize self-governing and self-supervision of the edge clouds.

EdgenceChain is the blockchain part behind Edgence project. It helps to construct trust between different parties and personals in a self-authorized style.

## Ubuntu 下节点启动方式

### 1. Python 3.6.7 的安装

所需 Python 环境 3.6.7，下载地址 https://www.python.org/ftp/python/3.6.7/Python-3.6.7.tgz 

依赖安装参考：https://github.com/EdgeIntelligenceChain/EdgenceChain/issues/57#issuecomment-472751311

下载完毕 Python-3.6.7.tgz 后，执行如下指令：

```
tar -xzf Python-3.6.7.tgz
cd Python-3.6.7
./configure --enable-optimizations  --prefix=/usr/local/python3.6.7/
make 
sudo make install
```

### 2. Python 虚拟环境的启动和配置

在 EdgenceChain 工程目录下启动 Python 虚拟环境

```
virtualenv --no-site-packages -p /usr/local/python3.6.7/bin/python3.6  venv
source venv/bin/activate
```

安装依赖

```
pip install -r requirements.txt
```

### 3. 节点配置

1. 当前结点端口的设置是在 `params/Params.py` 的 `PORT_CURRENT` 字段。 举例：将该节点的端口设置为9997: `PORT_CURRENT = int(9997)`

2. 如果该节点要与已经在运行的 EdgenceChain 主网，则需要提前配置种子节点。其位于 `params/Params.py` 的 `PEERS` 字段，节点由一个 Tuple 类型的 `(ip,port)` 表示其 ip 和 port 信息。可以配置多个这样的节点: `PEERS: Iterable[Tuple] = list([("127.0.0.1", 9997)])`

3. 如果该节点要通过任何的网络接口 (ip) 和其他节点连接，需要将 `params/Params.py` 文件下的 `PUBLIC_IP` 字段修改为你所使用的 ip 地址。

### 4. 节点运行

在 EdgenceChain 工程目录下执行 `python main.py`. 会默认运行服务端监听进程，挖矿进程，区块同步进程。

若要只运行服务端监听进程，执行 `python listening.py`.

如果让服务端只监听来自 localhost 的请求，将 `params/Params.py` 中的 `RECEIVE_LOCALHOST_MSG` 设置为 `True`。

### 外部程序与docker内运行程序的互联

1.docker外的启动

在第三步节点配置中第3部分位于 `params/Params.py` 的 `PUBLIC_IP` 使用主机网卡docker0对应的ip地址，在该命令行下运行main.py程序

2.docker内部的启动
   
   新开一个命令行，切换到 `EdgenceChain` 目录下
   
   docker build -t Edgence:docker .
   
   docker run Edgence:docker

    
