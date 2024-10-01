#!/bin/bash
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7


model_choice='densenet_tte'
nii_folder='/share/pi/nigam/data/inspect/anon_nii_gz' # '/local-scratch-nvme/nigam/PE/anon_nii_gz/anon_nii_gz' 
model_save_path='/share/pi/nigam/projects/zphuo/data/PE/Jose_monai_MRI/model_checkpoints/'   # '/local-scratch-nvme/nigam/PE/model_checkpoints' 
loadmodel_path='/share/pi/nigam/projects/zphuo/data/PE/Jose_monai_MRI/model_checkpoints/best_metric_model_8epoch_densenet_tte_0318.pth'  #'/local-scratch-nvme/nigam/PE/model_checkpoints/best_metric_model_0epoch_densenet_tte_0215.pth' 
TARGET_DIR='/share/pi/nigam/projects/zphuo/repos/PE_3D_multimodal/training/trash'
subset=''

python 1_pretrain_TTE.py \
    --model_choice $model_choice \
    --label_column '12_month_PH' \
    --val_interval 1 \
    --label_csv '/share/pi/nigam/projects/zphuo/data/PE/inspect/timelines_smallfiles_meds/cohort_0.2.0_master_file_anon'$subset'.csv' \
    --max_epochs 20 \
    --vocab_size 65536 \
    --num_tasks  8192 \
    --TARGET_DIR $TARGET_DIR \
    --batch_size 1 \
    --nii_folder $nii_folder \
    --model_save_path $model_save_path \
    --num_proc 20 \
    --use_cachedataset \
    --month_date_hour '022121' \
    --from_pretrained_tokenizer \
    --learning_rate 1e-3 \
    --dropout_prob 0.0 \
    --loadmodel_path $loadmodel_path


    # --linear_probe \
    # --test_subset
    # --mixed_precision \
    # --inference   
    # --prop_train 2000 \
    # --prop_val 2000 \




 

