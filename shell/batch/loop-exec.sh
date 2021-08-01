#!/bin/sh

doLoopExecutions() {
  echo $1
  # example
  # php artisan make:model $1
}

# 配列データ
models=(
"list1"
"list2"
"list3"
"list4"
"list5"
)

# 配列のループ処理
for model in ${models[@]};
do
  doLoopExecutions $model
done

# ex
# カレントディレクトリ内のファイル名を出力
# for file in *
# do
#   echo "${file}"
# done

