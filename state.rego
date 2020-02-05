
#   Copyright 2020 Google, Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

package tfstate.analysis

# allowed location / country
allowed_location = "us-"

# Allow only if there are no differences between
# expected and actual
test[{
	"passed": passed,
	"metadata" : metadata
}] {
	metadata := {
		"actual_location": actual[location],
		"allowed_location": allowed_location,
	}
	passed := startswith(actual[location], allowed_location)
}

location_test { passed := startswith(actual[location], allowed_location) }

# Get service names from resources where the type
# is google_container_cluster and set location
actual[location] {
	some i
	res := input.resources
	res[i].type == "google_container_cluster"
	location := res[i].instances[_].attributes.location
}
