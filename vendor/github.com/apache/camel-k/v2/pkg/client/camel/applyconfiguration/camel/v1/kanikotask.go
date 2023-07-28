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

// KanikoTaskApplyConfiguration represents an declarative configuration of the KanikoTask type for use
// with apply.
type KanikoTaskApplyConfiguration struct {
	BaseTaskApplyConfiguration    `json:",inline"`
	PublishTaskApplyConfiguration `json:",inline"`
	Verbose                       *bool                              `json:"verbose,omitempty"`
	Cache                         *KanikoTaskCacheApplyConfiguration `json:"cache,omitempty"`
	ExecutorImage                 *string                            `json:"executorImage,omitempty"`
}

// KanikoTaskApplyConfiguration constructs an declarative configuration of the KanikoTask type for use with
// apply.
func KanikoTask() *KanikoTaskApplyConfiguration {
	return &KanikoTaskApplyConfiguration{}
}

// WithName sets the Name field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Name field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithName(value string) *KanikoTaskApplyConfiguration {
	b.Name = &value
	return b
}

// WithContextDir sets the ContextDir field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the ContextDir field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithContextDir(value string) *KanikoTaskApplyConfiguration {
	b.ContextDir = &value
	return b
}

// WithBaseImage sets the BaseImage field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the BaseImage field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithBaseImage(value string) *KanikoTaskApplyConfiguration {
	b.BaseImage = &value
	return b
}

// WithImage sets the Image field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Image field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithImage(value string) *KanikoTaskApplyConfiguration {
	b.Image = &value
	return b
}

// WithRegistry sets the Registry field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Registry field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithRegistry(value *RegistrySpecApplyConfiguration) *KanikoTaskApplyConfiguration {
	b.Registry = value
	return b
}

// WithVerbose sets the Verbose field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Verbose field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithVerbose(value bool) *KanikoTaskApplyConfiguration {
	b.Verbose = &value
	return b
}

// WithCache sets the Cache field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Cache field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithCache(value *KanikoTaskCacheApplyConfiguration) *KanikoTaskApplyConfiguration {
	b.Cache = value
	return b
}

// WithExecutorImage sets the ExecutorImage field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the ExecutorImage field is set to the value of the last call.
func (b *KanikoTaskApplyConfiguration) WithExecutorImage(value string) *KanikoTaskApplyConfiguration {
	b.ExecutorImage = &value
	return b
}
