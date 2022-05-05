#!/bin/bash

###
# Script to update course content info with course specifics
###
root_dir="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/.."
declare -A replacements

# Course specific definitions (update these for your class)
replacements[adaltas_ldap_fqdn]=ipa1.au.adaltas.cloud
replacements[class_git_repository]=https://github.com/adaltas/dsti-bigdata-2022-spring.git
replacements[edge_node_fqdn]=edge-1.au.adaltas.cloud
replacements[edge_node_ip]=10.0.0.63
# Do not use . or - in group name (simplifies hive)
replacements[group_name]=dsti_2022_spring
replacements[mapreduce_examples_jar]=/usr/hdp/3.1.0.0-78/hadoop-mapreduce/hadoop-mapreduce-examples-3.1.1.3.1.0.0-78.jar
replacements[school]=dsti
replacements[spark_streaming_lab_checkpoint_path]="/education/dsti-bigdata-2022-spring/$USER/spark-streaming/checkpoint"
replacements[teacher_username]=dharty
replacements[teacher_email]=dharty@adaltas.com
replacements[yarn_applications_web_ui]="http://yarn-rm-1.au.adaltas.cloud:8088/ui2/#/yarn-apps/apps"

echo "Seaching in subfolders of $root_dir:"

# Replace the occurances of replacements
for i in "${!replacements[@]}"
do
  placeholder="<$i>"
  replacement="${replacements[$i]}"
  echo "Swapping $placeholder -> $replacement"
  find $root_dir -type f -exec sed -i -e "s|$placeholder|$replacement|g" {} \;
done
