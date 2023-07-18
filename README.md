# react-native-key-generator

Secure unique key generator for React Native

# Requirements
iOS >= 13.0\
Android >= 26

## Installation

```sh
npm i --save react-native-key-generator
```

## Usage

```js
import { generateSymmetricKey } from 'react-native-key-generator';

// ...

const key = await generateSymmetricKey({
    size: 256, // 128, 192 or 256 bit key
    outputEncoding: "base64" // base64 or hex
});

console.log(key);
// aZw4qfXzcvVb9mF9ojQIlvkSscGZ0b2NzdG48bRutUc=
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.
## Author

Hayr Hotoca | [@1limxapp](https://twitter.com/1limxapp)

## License

MIT

