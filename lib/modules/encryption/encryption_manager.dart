import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class EncryptionManager {
  //for AES Algorithms

  Encrypted? encrypted;
  var decrypted;
  Hash hasher = sha256;

  String encryptAES(plainText) {
    final key = Key.fromUtf8('abcdefghijklmnopqrstuvwxyz123456');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted!.base64;
  }

  String decryptAES(plainText) {
    final key = Key.fromUtf8('abcdefghijklmnopqrstuvwxyz123456');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    return decrypted;
  }

  String encryptSHA256(plainText) {
    var bytes1 = utf8.encode(plainText);
    var digest1 = sha256.convert(bytes1);
    return digest1.toString();
  }
}
