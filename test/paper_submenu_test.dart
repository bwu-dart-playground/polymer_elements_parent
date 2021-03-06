// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@TestOn('browser')
library polymer_elements.test.paper_progress_test;

import 'dart:html';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_submenu.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/iron_collapse.dart';
import 'package:web_components/web_components.dart';
import 'package:test/test.dart';
import 'common.dart';

/**
 * Original tests:
 * https://github.com/PolymerElements/paper-menu/tree/master/test
 */

main() async {
  await initWebComponents();

  group('<paper-submenu>', () {
    PaperMenu menu;
    PaperSubmenu sub1, sub2, sub3;
    IronCollapse collapse1, collapse2, collapse3;
    PaperItem trigger1, trigger2, trigger3;

    setUp(() {
      menu = fixture('basic');

      List subMenus = menu.querySelectorAll('paper-submenu');

      sub1 = subMenus[0];
      sub2 = subMenus[1];
      sub3 = subMenus[2];

      collapse1 = sub1.querySelector('iron-collapse');
      collapse2 = sub2.querySelector('iron-collapse');
      collapse3 = sub3.querySelector('iron-collapse');

      trigger1 = sub1.querySelector('.menu-trigger');
      trigger2 = sub2.querySelector('.menu-trigger');
      trigger3 = sub3.querySelector('.menu-trigger');
    });

    test('selecting an item expands the submenu', () {
      expect(collapse1.opened, isFalse);
      expect(collapse2.opened, isFalse);
      expect(collapse3.opened, isFalse);

      tap(trigger1);

      expect(collapse1.opened, isTrue);
      expect(collapse2.opened, isFalse);
      expect(collapse3.opened, isFalse);
    });

    test('selecting a different item closes the previously opened submenu', () {
      expect(collapse1.opened, isFalse);
      expect(collapse2.opened, isFalse);
      expect(collapse3.opened, isFalse);

      tap(trigger1);

      expect(collapse1.opened, isTrue);
      expect(collapse2.opened, isFalse);
      expect(collapse3.opened, isFalse);

      tap(trigger2);

      expect(collapse1.opened, isFalse);
      expect(collapse2.opened, isTrue);
      expect(collapse3.opened, isFalse);
    });

    test('cannot open a disabled submenu', () {
      expect(collapse1.opened, isFalse);
      expect(collapse2.opened, isFalse);
      expect(collapse3.opened, isFalse);

      tap(trigger3);

      expect(collapse1.opened, isFalse);
      expect(collapse2.opened, isFalse);
      expect(collapse3.opened, isFalse);
    });

    test('selecting an item styles it and the parent', () {
      DivElement boldDiv = new DivElement();
      boldDiv.style.fontWeight = 'bold';
      document.body.append(boldDiv);

      DivElement normalDiv = new DivElement();
      normalDiv.style.fontWeight = 'normal';
      document.body.append(normalDiv);

      expect(trigger1.getComputedStyle().fontWeight,
          equals(normalDiv.getComputedStyle().fontWeight),
          reason: 'default font weight should be "normal"');
      expect(trigger2.getComputedStyle().fontWeight,
          equals(normalDiv.getComputedStyle().fontWeight),
          reason: 'default font weight should be "normal"');
      expect(trigger3.getComputedStyle().fontWeight,
          equals(normalDiv.getComputedStyle().fontWeight),
          reason: 'default font weight should be "normal"');

      PaperItem item1 =
          sub1.querySelector('.menu-content').querySelector('paper-item');

      tap(trigger1);

      expect(item1.getComputedStyle().fontWeight,
          equals(normalDiv.getComputedStyle().fontWeight),
          reason: 'if not selected, submenu item font weight should be "normal"');

      tap(item1);

      expect(item1.getComputedStyle().fontWeight,
          boldDiv.getComputedStyle().fontWeight,
          reason: 'selected item should have fontweight: "bold"');
      expect(trigger1.getComputedStyle().fontWeight,
          boldDiv.getComputedStyle().fontWeight,
          reason: 'selected item should have fontweight: "bold"');
      expect(trigger2.getComputedStyle().fontWeight,
          normalDiv.getComputedStyle().fontWeight,
          reason: 'not selected item should have fontweight: "normal"');
      expect(trigger3.getComputedStyle().fontWeight,
          normalDiv.getComputedStyle().fontWeight,
          reason: 'not selected item should have fontweight: "normal"');
    });

    test('selecting a new item de-styles the previous one', () {
      DivElement boldDiv = document.createElement('div');
      boldDiv.style.fontWeight = 'bold';
      document.body.append(boldDiv);

      DivElement normalDiv = document.createElement('div');
      normalDiv.style.fontWeight = 'normal';
      document.body.append(normalDiv);

      expect(trigger1.getComputedStyle().fontWeight,
          normalDiv.getComputedStyle().fontWeight);
      expect(trigger2.getComputedStyle().fontWeight,
          normalDiv.getComputedStyle().fontWeight);
      expect(trigger3.getComputedStyle().fontWeight,
          normalDiv.getComputedStyle().fontWeight);

      var item1 =
          sub1.querySelector('.menu-content').querySelector('paper-item');
      var item2 =
          sub2.querySelector('.menu-content').querySelector('paper-item');

      tap(trigger1);
      tap(item1);
      tap(trigger2);
      tap(item2);

      // Both children are still selected even though the first one is hidden.
      expect(item1.getComputedStyle().fontWeight,
          boldDiv.getComputedStyle().fontWeight);
      expect(item2.getComputedStyle().fontWeight,
          boldDiv.getComputedStyle().fontWeight);

      expect(trigger1.getComputedStyle().fontWeight,
          normalDiv.getComputedStyle().fontWeight);
      expect(trigger2.getComputedStyle().fontWeight,
          boldDiv.getComputedStyle().fontWeight);
      expect(trigger3.getComputedStyle().fontWeight,
          normalDiv.getComputedStyle().fontWeight);
    });
  });
}
