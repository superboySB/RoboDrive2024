# RoboDrive2024
自动驾驶挑战赛 （BIT-LINC方案），我们（or我自己）准备玩一下`5`这个track，避开去卷纯视觉的BEVFormer，并且尽可能去尝试nvidia进行了TensorRT优化后的[那个版本](https://github.com/NVIDIA-AI-IOT/Lidar_AI_Solution/tree/master/CUDA-BEVFusion)（因为手上有硬件），尝试快速入门一下多模数据融合下的应用，感觉这会是一个蛮好的机会。

## 安装环境
```sh
cd ./track-5/BEVFusion/docker && docker build . -t bevfusion

docker run -it -v `pwd`/../data:/dataset bevfusion /bin/bash
```
代码相比RL是不多的，但数据相关的细节比较多，明天再搞hh