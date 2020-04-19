#!/bin/bash

set -e
export PATH=/home/ec2-user/anaconda3/bin/:$PATH
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
## SET TEMP FOLDER
export TMPDIR='/home/ec2-user/SageMaker/.tmp'

#conda config --set auto_stack 1
ENVIRONMENT=python3
source /home/ec2-user/anaconda3/bin/activate "$ENVIRONMENT"
pip install 'papermill==2.0.0'
pip install 'nbclient==0.1.0'
pip install pandas
pip install numpy
pip install fastparquet
pip install python-snappy


papermill -k python3 '/home/ec2-user/SageMaker/papermill_run.ipynb' '/home/ec2-user/SageMaker/papermill_run_executed.ipynb' --log-output
