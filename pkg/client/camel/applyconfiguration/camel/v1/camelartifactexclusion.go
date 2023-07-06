/*
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Code generated by applyconfiguration-gen. DO NOT EDIT.

package v1

// CamelArtifactExclusionApplyConfiguration represents an declarative configuration of the CamelArtifactExclusion type for use
// with apply.
type CamelArtifactExclusionApplyConfiguration struct {
	GroupID    *string `json:"groupId,omitempty"`
	ArtifactID *string `json:"artifactId,omitempty"`
}

// CamelArtifactExclusionApplyConfiguration constructs an declarative configuration of the CamelArtifactExclusion type for use with
// apply.
func CamelArtifactExclusion() *CamelArtifactExclusionApplyConfiguration {
	return &CamelArtifactExclusionApplyConfiguration{}
}

// WithGroupID sets the GroupID field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the GroupID field is set to the value of the last call.
func (b *CamelArtifactExclusionApplyConfiguration) WithGroupID(value string) *CamelArtifactExclusionApplyConfiguration {
	b.GroupID = &value
	return b
}

// WithArtifactID sets the ArtifactID field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the ArtifactID field is set to the value of the last call.
func (b *CamelArtifactExclusionApplyConfiguration) WithArtifactID(value string) *CamelArtifactExclusionApplyConfiguration {
	b.ArtifactID = &value
	return b
}