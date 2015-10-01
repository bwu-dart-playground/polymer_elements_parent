// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@HtmlImport('sinon.html')
library polymer_elements.test.src.sinon;

import 'dart:js';
import 'package:web_components/web_components.dart';

JsObject _Sinon = context['sinon'];

Spy spy([JsObject object, String methodName]) =>
    new Spy(_Sinon.callMethod('spy', [object, methodName]));

match(Map options) => _Sinon.callMethod('match', [new JsObject.jsify(options)]);

get matchAny => _Sinon['match']['any'];

class Spy {
  JsObject jsObject;

  Spy(this.jsObject);

  bool get calledOnce => jsObject['calledOnce'];

  bool calledWith(List<JsObject> matchers) =>
      jsObject.callMethod('calledWith', matchers);

  reset() => jsObject.callMethod('reset');
}
