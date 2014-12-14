#
# Cookbook Name:: hostsfile
# Recipe:: default
#
# Copyright 2012-2013, Seth Vargo
# Copyright 2012, CustomInk, LCC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unless node[:hostsfile].nil?
  node[:hostsfile].each do |ip, infos|
    hostsfile_entry ip do
      hostname    infos["hostname"]
      unique      infos["unique"]   || false
      aliases     infos["aliases"]  || []
      comment     infos["comment"]  || nil
    end
  end
end
