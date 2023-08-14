import CryptoKit

public extension Data {
    /// Hexadecimal string representation of `Data` object.
    var hexadecimal: String {
        let charA: UInt8 = 0x61
        let char0: UInt8 = 0x30
        func byteToChar(_ b: UInt8) -> Character {
            Character(UnicodeScalar(b > 9 ? charA + b - 10 : char0 + b))
        }
        let hexChars = flatMap {[
            byteToChar(($0 >> 4) & 0xF),
            byteToChar($0 & 0xF)
        ]}
        return String(hexChars)
    }
}

@available(iOS 13.0, *)
@objc(KeyGenerator)
class KeyGenerator: NSObject {

  @objc(generateSymmetricKey:withOutputEncoding:withResolver:withRejecter:)
  func generateSymmetricKey(size: Int, outputEncoding: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
      if (outputEncoding != "base64" && outputEncoding != "hex") {
          return reject("Output encoding error", "Output encoding should be in 'base64' or 'hex'", nil)
      }

      var newKey = SymmetricKey.init(size: SymmetricKeySize.bits256)
      switch size {
        case 128 :
            newKey = SymmetricKey.init(size: SymmetricKeySize.bits128)
        case 192:
            newKey = SymmetricKey.init(size: SymmetricKeySize.bits192)
        case 256:
            newKey = SymmetricKey.init(size: SymmetricKeySize.bits256)
        default:
            return reject("Key size error", "Key size should be 128, 192 or 256", nil)
      }

      let keyStr = outputEncoding == "base64" ? newKey.withUnsafeBytes {
          return Data(Array($0)).base64EncodedString()
      } : newKey.withUnsafeBytes {
          return Data(Array($0)).hexadecimal
      }
      
      resolve(keyStr)
  }
}
