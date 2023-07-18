import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { generateSymmetricKey } from 'react-native-key-generator';

export default function App() {
  const [result, setResult] = React.useState<string | undefined>();

  React.useEffect(() => {
    generateSymmetricKey({
      size: 256,
      outputEncoding: "base64"
    }).then(res => console.log(res))
      .catch(e => console.log(e));
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
