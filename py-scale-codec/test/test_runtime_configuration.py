# Python SCALE Codec Library
#
# Copyright 2018-2020 Stichting Polkascan (Polkascan Foundation).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#  test_runtime_configuration.py
#

import unittest

from scalecodec.base import RuntimeConfiguration
from scalecodec.type_registry import load_type_registry_preset


class TestScaleDecoderClasses(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        RuntimeConfiguration().clear_type_registry()
        RuntimeConfiguration().update_type_registry(load_type_registry_preset("default"))

    def test_valid_decoding_classes(self):
        for type_string in RuntimeConfiguration().type_registry['types'].keys():
            self.assertIsNotNone(RuntimeConfiguration().get_decoder_class(
                type_string), msg='"{}" didn\'t return decoding class'.format(type_string)
            )


if __name__ == '__main__':
    unittest.main()
