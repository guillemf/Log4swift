//
//  Logger+objeciveCTests.swift
//  Log4swift
//
//  Created by Jérôme Duquennoy on 29/07/15.
//  Copyright © 2015 Jérôme Duquennoy. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import XCTest
@testable import Log4swift

class LoggerObjectiveCTests: XCTestCase {
  
  func testLoggerObjectiveCLogStringMethodsLogsAtExpectedLevel() {
    let appender = MemoryAppender()
    appender.thresholdLevel = .Trace
    let logger = Logger(identifier: "test.logger", level: LogLevel.Trace, appenders: [appender])
    
    // Execute
    logger.logTrace("trace")
    logger.logDebug("debug")
    logger.logInfo("info")
    logger.logWarning("warning")
    logger.logError("error")
    logger.logFatal("fatal")
    
    // Validate
    XCTAssertEqual(appender.logMessages[0].level, LogLevel.Trace)
    XCTAssertEqual(appender.logMessages[1].level, LogLevel.Debug)
    XCTAssertEqual(appender.logMessages[2].level, LogLevel.Info)
    XCTAssertEqual(appender.logMessages[3].level, LogLevel.Warning)
    XCTAssertEqual(appender.logMessages[4].level, LogLevel.Error)
    XCTAssertEqual(appender.logMessages[5].level, LogLevel.Fatal)
  }
  
  func testLoggerObjectiveCLogBlocMethodsLogsAtExpectedLevel() {
    let appender = MemoryAppender()
    appender.thresholdLevel = .Trace
    let logger = Logger(identifier: "test.logger", level: LogLevel.Trace, appenders: [appender])
    
    // Execute
    logger.logTraceBloc({"Trace"})
    logger.logDebugBloc({"Debug"})
    logger.logInfoBloc({"info"})
    logger.logWarningBloc({"warning"})
    logger.logErrorBloc({"error"})
    logger.logFatalBloc({"fatal"})
    
    // Validate
    XCTAssertEqual(appender.logMessages[0].level, LogLevel.Trace)
    XCTAssertEqual(appender.logMessages[1].level, LogLevel.Debug)
    XCTAssertEqual(appender.logMessages[2].level, LogLevel.Info)
    XCTAssertEqual(appender.logMessages[3].level, LogLevel.Warning)
    XCTAssertEqual(appender.logMessages[4].level, LogLevel.Error)
    XCTAssertEqual(appender.logMessages[5].level, LogLevel.Fatal)
  }
  
  func testLoggerObjectiveCLogBlocWithFileAndLineMethodsLogsWithFileAndLine() {
    let appender = MemoryAppender()
    appender.thresholdLevel = .Trace
    let formatter = try! PatternFormatter(identifier:"testFormatter", pattern: "[%F]:[%L]:[%M] %m")
    appender.formatter = formatter
    let logger = Logger(identifier: "test.logger", level: LogLevel.Trace, appenders: [appender])
    
    // Execute
    logger.logTraceBloc({"message"}, file: "filename", line: 42, function: "function")
    logger.logDebugBloc({"message"}, file: "filename", line: 42, function: "function")
    logger.logInfoBloc({"message"}, file: "filename", line: 42, function: "function")
    logger.logWarningBloc({"message"}, file: "filename", line: 42, function: "function")
    logger.logErrorBloc({"message"}, file: "filename", line: 42, function: "function")
    logger.logFatalBloc({"message"}, file: "filename", line: 42, function: "function")
    
    // Validate
    XCTAssertEqual(appender.logMessages[0].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[1].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[2].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[3].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[4].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[5].message, "[filename]:[42]:[function] message")
  }
  
  
  func testLoggerObjectiveCLogMessageWithFileAndLineMethodsLogsWithFileAndLine() {
    let appender = MemoryAppender()
    appender.thresholdLevel = .Trace
    let formatter = try! PatternFormatter(identifier:"testFormatter", pattern: "[%F]:[%L]:[%M] %m")
    appender.formatter = formatter
    let logger = Logger(identifier: "test.logger", level: LogLevel.Trace, appenders: [appender])
    
    // Execute
    logger.logTrace("message", file: "filename", line: 42, function: "function")
    logger.logDebug("message", file: "filename", line: 42, function: "function")
    logger.logInfo("message", file: "filename", line: 42, function: "function")
    logger.logWarning("message", file: "filename", line: 42, function: "function")
    logger.logError("message", file: "filename", line: 42, function: "function")
    logger.logFatal("message", file: "filename", line: 42, function: "function")
    
    // Validate
    XCTAssertEqual(appender.logMessages[0].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[1].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[2].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[3].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[4].message, "[filename]:[42]:[function] message")
    XCTAssertEqual(appender.logMessages[5].message, "[filename]:[42]:[function] message")
  }
}
