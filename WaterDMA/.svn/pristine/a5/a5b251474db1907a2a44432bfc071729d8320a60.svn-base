var nonce  = '0CoJUm6Qyw8W8jud';

var modulus = '00de99a283cbbf8d47ee3804dcae712a482b25363a3d59aea5cbadb556820e0e4c5e21728fbcb229382942f1001c03f196e4204b5ee8bde9e98ab5c41bc0c6726ba39bcef5f68811fb8db6f0ffd773734a27a817258b645b815bf6c286ec8bf7614aeee6e647ccb3d7c0e40b2c238381697009ed4e1e1eac17963850537f511699'
var pubKey = '010001';

String.prototype.hexEncode = function() {
    var hex, i;

    var result = '';
    for (i = 0; i < this.length; i++) {
        hex = this.charCodeAt(i).toString(16);
        result += ('' + hex).slice(-4)
    }
    return result
};

function createSecretKey(size) {
    var keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var key = '';
    for (var i = 0; i < size; i++) {
        var pos = Math.random() * keys.length;
        pos = Math.floor(pos);
        key = key + keys.charAt(pos)
    }
    return key
}

function aesEncrypt(data,key){
    if(typeof data === 'object') data = JSON.stringify(data);
    key  = CryptoJS.enc.Utf8.parse(key);
    var iv   = CryptoJS.enc.Utf8.parse(nonce);
    var encrypted =CryptoJS.AES.encrypt(data,key,
        {
            iv:iv,
            mode:CryptoJS.mode.CBC,
            padding:CryptoJS.pad.Pkcs7
        });
    return encrypted.toString();    //返回的是base64格式的密文
}

function aceDecryption(encrypted, key) {
    key  = CryptoJS.enc.Utf8.parse(key);
    var iv   = CryptoJS.enc.Utf8.parse(nonce);
    var decrypted = CryptoJS.AES.decrypt(encrypted, key,
        {
            iv : iv,
            mode : CryptoJS.mode.CBC,
            padding : CryptoJS.pad.Pkcs7
        });
    return decrypted.toString(CryptoJS.enc.Utf8);
}

function zfill(str, size) {
    while (str.length < size) str = '0' + str;
    return str
}

function rsaEncrypt(text, pubKey, modulus) {
    var _text = text.split('').reverse().join('');
    var biText = bigInt(_text.hexEncode(), 16),
        biEx = bigInt(pubKey, 16),
        biMod = bigInt(modulus, 16),
        biRet = biText.modPow(biEx, biMod);
    return zfill(biRet.toString(16), 256)
}

function Encrypt(obj) {
    var text = typeof obj === 'object' ? JSON.stringify(obj) : obj;
    var secKey = createSecretKey(16);
    var encText = aesEncrypt(aesEncrypt(text, nonce), secKey);
    var encSecKey = rsaEncrypt(secKey, pubKey, modulus);
    return {
        params: encText,
        encSecKey: encSecKey
    }
}