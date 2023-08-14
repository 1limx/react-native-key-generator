package com.keygenerator

import com.facebook.common.util.Hex
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import java.util.Base64
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey

class KeyGeneratorModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun generateSymmetricKey(size: Int, outputEncoding: String, promise: Promise) {
    try {
      if (size != 128 && size != 192 && size != 256) {
        return promise.reject("Key size error", "Key size should be 128, 192 or 256", null)
      }

      if (outputEncoding != "base64" && outputEncoding != "hex") {
        return promise.reject("Output encoding error", "Output encoding should be in 'base64' or 'hex'", null)
      }
      val keygen = KeyGenerator.getInstance("ChaCha20")

      keygen.init(size)
      val key: SecretKey = keygen.generateKey()
      val encodedKey = if (outputEncoding == "base64")
        String(Base64.getEncoder().encode(key.encoded))
      else Hex.encodeHex(key.encoded, false)

      promise.resolve(encodedKey)
    } catch (e: Exception) {
      promise.reject("generate symmetric key", e.localizedMessage, e)
    }
  }

  companion object {
    const val NAME = "KeyGenerator"
  }
}
