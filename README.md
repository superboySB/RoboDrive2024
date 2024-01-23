# RoboDrive2024
自动驾驶挑战赛 （BIT-LINC方案），我们（or我自己）准备玩一下`5`这个track，避开去卷纯视觉的BEVFormer，并且尽可能去尝试nvidia进行了TensorRT优化后的[那个版本](https://github.com/NVIDIA-AI-IOT/Lidar_AI_Solution/tree/master/CUDA-BEVFusion)（因为手上有硬件），尝试快速入门一下多模数据融合下的应用，感觉这会是一个蛮好的机会。

## 安装环境


### 部署Docker运行环境
用docker安装运行环境，然后下载代码
```sh
docker build . -t bevfusion:latest --network host

docker run -itd --privileged -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY --gpus all --network=host --name=bevfusion bevfusion:latest /bin/bash

docker exec -it bevfusion /bin/bash

cd /workspace && git clone https://github.com/superboySB/RoboDrive2024
```

拥有一个[OpenDataLab](https://opendatalab.com)的账户，然后登录并下载nuscenes数据集，大概要下载4点开始
```sh
odl login

mim download mmdet3d --dataset nuscenes
```
准备[比赛验证用数据](https://drive.google.com/file/d/1Hw59VToELsB_bJ9qTGuyn9zdDzaZSnT4/view?usp=sharing)并解压，然后确定他们摆成了这样

```bash
.
├── data
│   ├── nuscenes
│   └── robodrive-sensor
├── configs
├── mmdet3d
└── tools
```
安装环境的主要包
```sh
python setup.py develop
```
然后运行`bash tools/create_data.sh`生成`.pkl`文件用于验证，或者可以直接在[这个页面](https://drive.google.com/drive/folders/1IAGH-io2wR3YjhNTMPc5Vp7kIRwa5Vdw)下载三个`.pkl`，然后放置在`./data/nuscenes/`位置

可以看到`nuscenes`文件夹长这样
```bash
.
├── basemap
├── can_bus
├── can_bus.zip
├── expansion
├── lidarseg
├── maps
├── nuscenes_infos_train.pkl
├── nuscenes_infos_val.pkl
├── nuScenes-panoptic-v1.0-all
├── prediction
├── robodrive_infos_test.pkl
├── robodrive-v1.0-test
├── samples
├── sweeps
├── v1.0-mini
├── v1.0-test
├── v1.0-trainval
```
```sh
bash tools/test_corruption.sh
```

