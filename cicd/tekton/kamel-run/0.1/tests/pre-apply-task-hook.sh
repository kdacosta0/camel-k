#!/usr/bin/env bash

# ---------------------------------------------------------------------------
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
# ---------------------------------------------------------------------------

add_sidecar_registry ${TMPF}

# Install Camel K operator
wget https://github.com/apache/camel-k/releases/download/v2.0.0/camel-k-client-2.0.0-linux-amd64.tar.gz
tar -xvf camel-k-client-2.0.0-linux-amd64.tar.gz
./kamel install --registry localhost:5000 --registry-insecure --wait

# Add git-clone
add_task git-clone 0.7