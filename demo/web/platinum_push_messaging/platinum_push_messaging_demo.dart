/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('platinum_push_messaging_demo.html')
library polymer_elements_demo.web.platinum_push_messaging.platinum_push_messaging_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/paper_styles.dart';
import 'package:polymer_elements/global.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_toggle_button.dart';
import 'package:polymer_elements/platinum_push_messaging.dart';
import 'package:polymer_elements_demo/styles/demo_elements.dart';

/// Silence analyzer [PaperStyles], [Global], [PaperItem], [PaperMaterial], [PaperToggleButton], [PlatinumPushMessaging], [DemoElements],
@PolymerRegister('platinum-push-messaging-demo')
class PlatinumPushMessagingDemo extends PolymerElement {
  PlatinumPushMessagingDemo.created() : super.created();
}
