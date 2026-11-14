
//
//  StandardSpeechRecognizer.swift
//  SmartBoard iOS
//
//  Reconhecimento de voz com APIs nativas da Apple.
//  Sem dependencias do KeyboardKitPro.
//

import Foundation
import Speech
import AVFoundation

public final class StandardSpeechRecognizer {

    public static let standard = StandardSpeechRecognizer()

    private var recognizer: SFSpeechRecognizer?
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    public init() {}

    public var authorizationStatus: SFSpeechRecognizerAuthorizationStatus {
        SFSpeechRecognizer.authorizationStatus()
    }

    public var supportedLocales: [Locale] {
        Array(SFSpeechRecognizer.supportedLocales())
    }

    public func requestDictationAuthorization() async
        -> SFSpeechRecognizerAuthorizationStatus {

        await withCheckedContinuation { continuation in
            SFSpeechRecognizer.requestAuthorization { status in
                continuation.resume(returning: status)
            }
        }
    }

    public func startDictation(
        with locale: Locale,
        resultHandler: @escaping (String, Bool, Error?) -> Void
    ) throws {

        stopDictation()

        guard let speechRecognizer = SFSpeechRecognizer(locale: locale) else {
            throw SpeechRecognizerError.unavailable
        }

        guard speechRecognizer.isAvailable else {
            throw SpeechRecognizerError.unavailable
        }

        recognizer = speechRecognizer

        let recognitionRequest =
            SFSpeechAudioBufferRecognitionRequest()

        recognitionRequest.shouldReportPartialResults = true

        request = recognitionRequest

        recognitionTask = speechRecognizer.recognitionTask(
            with: recognitionRequest
        ) { result, error in

            let text = result?.bestTranscription.formattedString ?? ""
            let isFinal = result?.isFinal ?? false

            resultHandler(text, isFinal, error)
        }
    }

    public func setupAudioEngineBuffer(
        _ buffer: AVAudioPCMBuffer
    ) {
        request?.append(buffer)
    }

    public func stopDictation() {

        request?.endAudio()
        recognitionTask?.cancel()

        recognitionTask = nil
        request = nil
        recognizer = nil
    }

    public func resetDictationResult() {
        stopDictation()
    }
}

public enum SpeechRecognizerError: Error {
    case unavailable
}
