# RoboDrive2024
自动驾驶挑战赛 （BIT-LINC方案），我们（or我自己）准备玩一下`5`这个track，避开去卷纯视觉的BEVFormer，并且尽可能去尝试nvidia进行了TensorRT优化后的[那个版本](https://github.com/NVIDIA-AI-IOT/Lidar_AI_Solution/tree/master/CUDA-BEVFusion)（因为手上有硬件），尝试快速入门一下多模数据融合下的应用，感觉这会是一个蛮好的机会。

## 安装环境
### 准备数据
We use nuScenes train split as the training data and use robodrive dataset as the evaluation data. For training data preparation, please refer to [nuscenes_det.md](https://github.com/open-mmlab/mmdetection3d/blob/master/docs/en/datasets/nuscenes_det.md). 

For evaluation data preparetion, please first download the dataset from [RoboDrive](https://drive.google.com/file/d/1Hw59VToELsB_bJ9qTGuyn9zdDzaZSnT4/view?usp=sharing) and organize folder structure like this:

```bash
.
├── data
│   ├── nuscenes
│   └── robodrive-sensor
├── configs
├── mmdet3d
└── tools
```

Then run the following command to generate the evaluation dataset. You can also download the generated `.pkl` file from [Google Drive](https://drive.google.com/drive/folders/1IAGH-io2wR3YjhNTMPc5Vp7kIRwa5Vdw?usp=sharing).

```bash
bash tools/create_data.sh
```

The nuscenes folder should be like this:

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

### 部署Docker运行环境
数据准备好后，用docker安装运行环境
```sh
cd ./track-5/BEVFusion/docker && docker build . -t bevfusion --network host

docker run -it -v `pwd`/../data:/dataset bevfusion /bin/bash
```
代码相比RL是不多的，但数据相关的细节比较多，明天再搞hh