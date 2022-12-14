# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: test_plugin_service.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x19test_plugin_service.proto\x12\x0fios_test_plugin\"Q\n\x18TestCaseWillStartRequest\x12\x35\n\x0etest_case_info\x18\x01 \x01(\x0b\x32\x1d.ios_test_plugin.TestCaseInfo\"\x1b\n\x19TestCaseWillStartResponse\"Q\n\x18TestCaseDidFinishRequest\x12\x35\n\x0etest_case_info\x18\x01 \x01(\x0b\x32\x1d.ios_test_plugin.TestCaseInfo\"\x1b\n\x19TestCaseDidFinishResponse\"O\n\x16TestCaseDidFailRequest\x12\x35\n\x0etest_case_info\x18\x01 \x01(\x0b\x32\x1d.ios_test_plugin.TestCaseInfo\"\x19\n\x17TestCaseDidFailResponse\"\x1b\n\x19ListEnabledPluginsRequest\"5\n\x1aListEnabledPluginsResponse\x12\x17\n\x0f\x65nabled_plugins\x18\x01 \x03(\t\"\x1c\n\x0cTestCaseInfo\x12\x0c\n\x04name\x18\x01 \x01(\t2\xc8\x03\n\x11TestPluginService\x12l\n\x11TestCaseWillStart\x12).ios_test_plugin.TestCaseWillStartRequest\x1a*.ios_test_plugin.TestCaseWillStartResponse\"\x00\x12l\n\x11TestCaseDidFinish\x12).ios_test_plugin.TestCaseDidFinishRequest\x1a*.ios_test_plugin.TestCaseDidFinishResponse\"\x00\x12\x66\n\x0fTestCaseDidFail\x12\'.ios_test_plugin.TestCaseDidFailRequest\x1a(.ios_test_plugin.TestCaseDidFailResponse\"\x00\x12o\n\x12ListEnabledPlugins\x12*.ios_test_plugin.ListEnabledPluginsRequest\x1a+.ios_test_plugin.ListEnabledPluginsResponse\"\x00\x42\x02H\x03\x62\x06proto3')



_TESTCASEWILLSTARTREQUEST = DESCRIPTOR.message_types_by_name['TestCaseWillStartRequest']
_TESTCASEWILLSTARTRESPONSE = DESCRIPTOR.message_types_by_name['TestCaseWillStartResponse']
_TESTCASEDIDFINISHREQUEST = DESCRIPTOR.message_types_by_name['TestCaseDidFinishRequest']
_TESTCASEDIDFINISHRESPONSE = DESCRIPTOR.message_types_by_name['TestCaseDidFinishResponse']
_TESTCASEDIDFAILREQUEST = DESCRIPTOR.message_types_by_name['TestCaseDidFailRequest']
_TESTCASEDIDFAILRESPONSE = DESCRIPTOR.message_types_by_name['TestCaseDidFailResponse']
_LISTENABLEDPLUGINSREQUEST = DESCRIPTOR.message_types_by_name['ListEnabledPluginsRequest']
_LISTENABLEDPLUGINSRESPONSE = DESCRIPTOR.message_types_by_name['ListEnabledPluginsResponse']
_TESTCASEINFO = DESCRIPTOR.message_types_by_name['TestCaseInfo']
TestCaseWillStartRequest = _reflection.GeneratedProtocolMessageType('TestCaseWillStartRequest', (_message.Message,), {
  'DESCRIPTOR' : _TESTCASEWILLSTARTREQUEST,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.TestCaseWillStartRequest)
  })
_sym_db.RegisterMessage(TestCaseWillStartRequest)

TestCaseWillStartResponse = _reflection.GeneratedProtocolMessageType('TestCaseWillStartResponse', (_message.Message,), {
  'DESCRIPTOR' : _TESTCASEWILLSTARTRESPONSE,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.TestCaseWillStartResponse)
  })
_sym_db.RegisterMessage(TestCaseWillStartResponse)

TestCaseDidFinishRequest = _reflection.GeneratedProtocolMessageType('TestCaseDidFinishRequest', (_message.Message,), {
  'DESCRIPTOR' : _TESTCASEDIDFINISHREQUEST,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.TestCaseDidFinishRequest)
  })
_sym_db.RegisterMessage(TestCaseDidFinishRequest)

TestCaseDidFinishResponse = _reflection.GeneratedProtocolMessageType('TestCaseDidFinishResponse', (_message.Message,), {
  'DESCRIPTOR' : _TESTCASEDIDFINISHRESPONSE,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.TestCaseDidFinishResponse)
  })
_sym_db.RegisterMessage(TestCaseDidFinishResponse)

TestCaseDidFailRequest = _reflection.GeneratedProtocolMessageType('TestCaseDidFailRequest', (_message.Message,), {
  'DESCRIPTOR' : _TESTCASEDIDFAILREQUEST,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.TestCaseDidFailRequest)
  })
_sym_db.RegisterMessage(TestCaseDidFailRequest)

TestCaseDidFailResponse = _reflection.GeneratedProtocolMessageType('TestCaseDidFailResponse', (_message.Message,), {
  'DESCRIPTOR' : _TESTCASEDIDFAILRESPONSE,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.TestCaseDidFailResponse)
  })
_sym_db.RegisterMessage(TestCaseDidFailResponse)

ListEnabledPluginsRequest = _reflection.GeneratedProtocolMessageType('ListEnabledPluginsRequest', (_message.Message,), {
  'DESCRIPTOR' : _LISTENABLEDPLUGINSREQUEST,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.ListEnabledPluginsRequest)
  })
_sym_db.RegisterMessage(ListEnabledPluginsRequest)

ListEnabledPluginsResponse = _reflection.GeneratedProtocolMessageType('ListEnabledPluginsResponse', (_message.Message,), {
  'DESCRIPTOR' : _LISTENABLEDPLUGINSRESPONSE,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.ListEnabledPluginsResponse)
  })
_sym_db.RegisterMessage(ListEnabledPluginsResponse)

TestCaseInfo = _reflection.GeneratedProtocolMessageType('TestCaseInfo', (_message.Message,), {
  'DESCRIPTOR' : _TESTCASEINFO,
  '__module__' : 'test_plugin_service_pb2'
  # @@protoc_insertion_point(class_scope:ios_test_plugin.TestCaseInfo)
  })
_sym_db.RegisterMessage(TestCaseInfo)

_TESTPLUGINSERVICE = DESCRIPTOR.services_by_name['TestPluginService']
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  DESCRIPTOR._serialized_options = b'H\003'
  _TESTCASEWILLSTARTREQUEST._serialized_start=46
  _TESTCASEWILLSTARTREQUEST._serialized_end=127
  _TESTCASEWILLSTARTRESPONSE._serialized_start=129
  _TESTCASEWILLSTARTRESPONSE._serialized_end=156
  _TESTCASEDIDFINISHREQUEST._serialized_start=158
  _TESTCASEDIDFINISHREQUEST._serialized_end=239
  _TESTCASEDIDFINISHRESPONSE._serialized_start=241
  _TESTCASEDIDFINISHRESPONSE._serialized_end=268
  _TESTCASEDIDFAILREQUEST._serialized_start=270
  _TESTCASEDIDFAILREQUEST._serialized_end=349
  _TESTCASEDIDFAILRESPONSE._serialized_start=351
  _TESTCASEDIDFAILRESPONSE._serialized_end=376
  _LISTENABLEDPLUGINSREQUEST._serialized_start=378
  _LISTENABLEDPLUGINSREQUEST._serialized_end=405
  _LISTENABLEDPLUGINSRESPONSE._serialized_start=407
  _LISTENABLEDPLUGINSRESPONSE._serialized_end=460
  _TESTCASEINFO._serialized_start=462
  _TESTCASEINFO._serialized_end=490
  _TESTPLUGINSERVICE._serialized_start=493
  _TESTPLUGINSERVICE._serialized_end=949
# @@protoc_insertion_point(module_scope)
