// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@TestOn('browser')
library polymer_elements.test.paper_menu_test;

import 'dart:html';
import 'package:polymer_elements/paper_menu.dart';
import 'package:web_components/web_components.dart';
import 'package:test/test.dart';
import 'common.dart';

main() async {
  await initWebComponents();

  group('<paper-menu>', () {
    PaperMenu menu;
    setUp(() {
      menu = fixture('basic');
    });

    test('selected item is styled', () {
      DivElement boldDiv = new DivElement();
      boldDiv.style.fontWeight = 'bold';
      document.body.append(boldDiv);

      menu.select('1');

      expect(menu.selectedItems[0].getComputedStyle().fontWeight,
          boldDiv.getComputedStyle().fontWeight,
          reason: 'selected item should be bold');
    });
  });
}
