#!/bin/bash

experiment=my_sb

python train.py \
        --input_sources SI2017 ALTI \
        --target_source TLM5c \
        --interm_target_sources TH TCD1 \
        --train_csv_fn data/csv/SI2017_ALTI_TH_TCD1_TLM5c_train_with_counts.csv \
        --val_csv_fn data/csv/SI2017_ALTI_TH_TCD1_TLM5c_val.csv \
        --batch_size 16 \
        --num_epochs 20 \
        --lr 1e-5 1e-6 1e-6 1e-7 \
        --learning_schedule 5 5 5 5 \
        --n_negative_samples 0 5 10 20 40 80 160 320 320 320 \
        --negative_sampling_schedule 2 2 2 2 2 2 2 2 2 2 \
        --decision h \
        --penalize_correction \
        --regression_loss MSElog MSE \
        --lambda_bin 1 \
        --lambda_sem 1.0 0.75 0.5 0.25 \
        --lambda_corr 1.0 \
        --num_workers 2 \
        --output_dir output/$experiment \
        --no_user_input \
        #> log_{$experiment}_training.txt
