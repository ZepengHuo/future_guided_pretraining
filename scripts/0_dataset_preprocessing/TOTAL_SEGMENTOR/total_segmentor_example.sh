#!/bin/bash
#SBATCH --job-name=TotalSegmentator
#SBATCH --output=../logs/output_%j.out
#SBATCH --error=../logs/error_%j.err
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --ntasks=1
#SBATCH --mem=100G
#SBATCH --cpus-per-task=10
#SBATCH --gres=gpu:2
#SBATCH --exclude=secure-gpu-1,secure-gpu-2,secure-gpu-3
#SBATCH --time=48:00:00 



# Print current Enviorment 
echo "current conda enviorment: $CONDA_DEFAULT_ENV"

# Check the available GPU with nvidia-smi
#nvidia-smi


# Execute python 
export CUDA_LAUNCH_BLOCKING=1

python total_segmentor_example.py