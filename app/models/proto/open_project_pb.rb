# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: lib/proto/open_project.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'

# it's required by zeitwerk eager_load
module Proto
  module OpenProjectPb
  end
end

descriptor_data = "\n\x1clib/proto/open_project.proto\x1a\x1bgoogle/protobuf/empty.proto\"0\n\x10TemplateDataItem\x12\r\n\x05value\x18\x01 \x01(\t\x12\r\n\x05\x63olor\x18\x02 \x01(\t\"\xbd\x01\n\x0eMessageRequest\x12\x12\n\ntemplateID\x18\x01 \x01(\t\x12\'\n\x04\x64\x61ta\x18\x02 \x03(\x0b\x32\x19.MessageRequest.DataEntry\x12\x0b\n\x03url\x18\x03 \x01(\t\x12\x10\n\x08toUserID\x18\x04 \x01(\x03\x12\x0f\n\x07toLogin\x18\x05 \x01(\t\x1a>\n\tDataEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12 \n\x05value\x18\x02 \x01(\x0b\x32\x11.TemplateDataItem:\x02\x38\x01\"\'\n\x06Result\x12\x0c\n\x04\x63ode\x18\x01 \x01(\x03\x12\x0f\n\x07message\x18\x02 \x01(\t\"J\n\x08Template\x12\r\n\x05title\x18\x01 \x01(\t\x12\x12\n\ntemplateID\x18\x02 \x01(\t\x12\x0c\n\x04\x62ody\x18\x03 \x01(\t\x12\r\n\x05trade\x18\x04 \x01(\t\"/\n\x0fGetTemplateResp\x12\x1c\n\ttemplates\x18\x01 \x03(\x0b\x32\t.Template\"\x18\n\x08RespUser\x12\x0c\n\x04mail\x18\x01 \x01(\t\"$\n\x14GetUserInfoByCodeReq\x12\x0c\n\x04\x63ode\x18\x01 \x01(\t\"i\n\x10WorkerMessageReq\x12\x10\n\x08toUserID\x18\x01 \x01(\x03\x12\r\n\x05title\x18\x02 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x03 \x01(\t\x12\x0b\n\x03url\x18\x04 \x01(\t\x12\x12\n\nbuttonText\x18\x05 \x01(\t\"\xb9\x01\n\nReportForm\x12\n\n\x02ID\x18\x01 \x01(\x03\x12\x17\n\x0fReportProjectID\x18\x02 \x01(\x03\x12\x0c\n\x04Type\x18\x03 \x01(\t\x12\x0f\n\x07Subject\x18\x04 \x01(\t\x12\x0e\n\x06Status\x18\x05 \x01(\t\x12\x11\n\tStartTime\x18\x06 \x01(\t\x12\x0f\n\x07\x45ndTime\x18\x07 \x01(\t\x12\x10\n\x08\x44uration\x18\x08 \x01(\t\x12\x0f\n\x07Remarks\x18\t \x01(\t\x12\x10\n\x08ParentID\x18\n \x01(\x03\"5\n\tGetPdfReq\x12\x19\n\x04\x44\x61ta\x18\x01 \x03(\x0b\x32\x0b.ReportForm\x12\r\n\x05\x45mail\x18\x02 \x01(\t\"\x19\n\nGetPdfResp\x12\x0b\n\x03url\x18\x01 \x01(\t\"\"\n\rPlmProjectReq\x12\x11\n\tProjectID\x18\x01 \x01(\x03\"&\n\x16ShowEstimateButtonResp\x12\x0c\n\x04show\x18\x01 \x01(\x08\x32\xba\x02\n\tOpService\x12\'\n\x0bSendMessage\x12\x0f.MessageRequest\x1a\x07.Result\x12\x38\n\x0cGetTemplates\x12\x16.google.protobuf.Empty\x1a\x10.GetTemplateResp\x12\x35\n\x11GetUserInfoByCode\x12\x15.GetUserInfoByCodeReq\x1a\t.RespUser\x12\x31\n\x13SendWcWorkerMessage\x12\x11.WorkerMessageReq\x1a\x07.Result\x12!\n\x06GetPdf\x12\n.GetPdfReq\x1a\x0b.GetPdfResp\x12=\n\x12ShowEstimateButton\x12\x0e.PlmProjectReq\x1a\x17.ShowEstimateButtonRespB\x0eZ\x0c../opServiceb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

TemplateDataItem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TemplateDataItem").msgclass
MessageRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("MessageRequest").msgclass
Result = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Result").msgclass
Template = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Template").msgclass
GetTemplateResp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("GetTemplateResp").msgclass
RespUser = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("RespUser").msgclass
GetUserInfoByCodeReq = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("GetUserInfoByCodeReq").msgclass
WorkerMessageReq = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("WorkerMessageReq").msgclass
ReportForm = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("ReportForm").msgclass
GetPdfReq = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("GetPdfReq").msgclass
GetPdfResp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("GetPdfResp").msgclass
PlmProjectReq = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("PlmProjectReq").msgclass
ShowEstimateButtonResp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("ShowEstimateButtonResp").msgclass