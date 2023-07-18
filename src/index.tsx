import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-key-generator' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const KeyGenerator = NativeModules.KeyGenerator
  ? NativeModules.KeyGenerator
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

type GenerateSymmetricKeyInput = {
  size: number;
  outputEncoding: string;
}

export function generateSymmetricKey(input: GenerateSymmetricKeyInput): Promise<string> {
  const { size, outputEncoding } = input;
  return KeyGenerator.generateSymmetricKey(size, outputEncoding);
}
