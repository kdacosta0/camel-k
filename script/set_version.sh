#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "usage: $0 version [image_name]"
    exit 1
fi

location=$(dirname $0)
version=$1
image_name=${2:-docker.io\/apache\/camel-k}
sanitized_image_name=${image_name//\//\\\/}

if [ -d $location/../config/manager ]; then
  for f in $(find $location/../config/manager -type f -name "*.yaml");
  do
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sed -i -r "s/docker.io\/apache\/camel-k:([0-9]+[a-zA-Z0-9\-\.].*).*/${sanitized_image_name}:${version}/" $f
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      # Mac OSX
      sed -i '' -E "s/docker.io\/apache\/camel-k:([0-9]+[a-zA-Z0-9\-\.].*).*/${sanitized_image_name}:${version}/" $f
    fi
  done
fi

if [ -d $location/../config/manifests/bases ]; then
  for f in $(find $location/../config/manifests/bases -type f -name "*.yaml");
  do
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sed -i -r "s/docker.io\/apache\/camel-k:([0-9]+[a-zA-Z0-9\-\.].*).*/${sanitized_image_name}:${version}/" $f
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      # Mac OSX
      sed -i '' -E "s/docker.io\/apache\/camel-k:([0-9]+[a-zA-Z0-9\-\.].*).*/${sanitized_image_name}:${version}/" $f
    fi
  done
fi

# Update helm chart
if [ -d $location/../helm/camel-k ]; then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i -r "s/docker.io\/apache\/camel-k:([0-9]+[a-zA-Z0-9\-\.].*).*/${sanitized_image_name}:${version}/" $location/../helm/camel-k/values.yaml
    sed -i -r "s/appVersion:\s([0-9]+[a-zA-Z0-9\-\.].*).*/appVersion: ${version}/" $location/../helm/camel-k/Chart.yaml
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    sed -i '' -E "s/docker.io\/apache\/camel-k:([0-9]+[a-zA-Z0-9\-\.].*).*/${sanitized_image_name}:${version}/" $location/../helm/camel-k/values.yaml
    sed -i '' -E "s/appVersion:\s([0-9]+[a-zA-Z0-9\-\.].*).*/appVersion: ${version}/" $location/../helm/camel-k/Chart.yaml
  fi
fi

if [ -f $location/../go.mod ]; then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i "s~github\.com/apache/camel\-k/pkg/apis/camel v[0-9.]\+~github\.com/apache/camel\-k/pkg/apis/camel v$version~" $location/../go.mod
    sed -i "s~github\.com/apache/camel\-k/pkg/client/camel v[0-9.]\+~github\.com/apache/camel\-k/pkg/client/camel v$version~" $location/../go.mod
    sed -i "s~github\.com/apache/camel\-k/pkg/kamelet/repository v[0-9.]\+~github\.com/apache/camel\-k/pkg/kamelet/repository v$version~" $location/../go.mod
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i "s~github\.com/apache/camel\-k/pkg/apis/camel v[0-9.]\+~github\.com/apache/camel\-k/pkg/apis/camel v$version~" $location/../go.mod
    sed -i "s~github\.com/apache/camel\-k/pkg/client/camel v[0-9.]\+~github\.com/apache/camel\-k/pkg/client/camel v$version~" $location/../go.mod
    sed -i "s~github\.com/apache/camel\-k/pkg/kamelet/repository v[0-9.]\+~github\.com/apache/camel\-k/pkg/kamelet/repository v$version~" $location/../go.mod
  fi
fi

if [ -f $location/../vendor/modules.txt ]; then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i "s~github\.com/apache/camel\-k/pkg/apis/camel v[0-9.]\+ \(.*\)~github\.com/apache/camel\-k/pkg/apis/camel v$version \1~" $location/../vendor/modules.txt
    sed -i "s~github\.com/apache/camel\-k/pkg/client/camel v[0-9.]\+~github\.com/apache/camel\-k/pkg/client/camel v$version~" $location/../vendor/modules.txt
    sed -i "s~github\.com/apache/camel\-k/pkg/kamelet/repository v[0-9.]\+~github\.com/apache/camel\-k/pkg/kamelet/repository v$version~" $location/../vendor/modules.txt
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' -E "s~github\.com/apache/camel\-k/pkg/apis/camel v[0-9.]\+ \(.*\)~github\.com/apache/camel\-k/pkg/apis/camel v$version \1~" $location/../vendor/modules.txt
    sed -i '' -E "s~github\.com/apache/camel\-k/pkg/client/camel v[0-9.]\+~github\.com/apache/camel\-k/pkg/client/camel v$version~" $location/../vendor/modules.txt
    sed -i '' -E "s~github\.com/apache/camel\-k/pkg/kamelet/repository v[0-9.]\+~github\.com/apache/camel\-k/pkg/kamelet/repository v$version~" $location/../vendor/modules.txt
  fi
fi

echo "Camel K version set to: $version and image name to: $image_name"
