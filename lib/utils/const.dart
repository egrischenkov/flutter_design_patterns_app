import 'package:flutter/material.dart';

final globalKey = GlobalKey<NavigatorState>();

const String designPatternsJsonPath = 'assets/config/config_design_patterns.json';
const String markdownPath = 'assets/markdown/';

const String enLocaleName = 'English';
const String ruLocaleName = 'Русский';

//design patterns id for switching colors
const abstractFactoryId = 'abstract_factory';
const adapterId = 'adapter';
const bridgeId = 'bridge';
const builderId = 'builder';
const chainOfResponsibilityId = 'chain_of_responsibility';
const commandId = 'command';
const compositeId = 'composite';
const decoratorId = 'decorator';
const facadeId = 'facade';
const factoryMethodId = 'factory_method';
const flyweightId = 'flyweight';
const iteratorId = 'iterator';
const mediatorId = 'mediator';
const mementoId = 'memento';
const observerId = 'observer';
const prototypeId = 'prototype';
const proxyId = 'proxy';
const singletonId = 'singleton';
const stateId = 'state';
const strategyId = 'strategy';
const templateMethodId = 'template_method';
const visitorId = 'visitor';