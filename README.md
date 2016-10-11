# RSA_Base
非对称加密技术、RSA
基本原理
RSA使用"秘匙对"对数据进行加密解密.在加密解密数据前,需要先生成公钥(public key)和私钥(private key).

公钥(public key): 用于加密数据. 用于公开, 一般存放在数据提供方, 例如iOS客户端.
私钥(private key): 用于解密数据. 必须保密, 私钥泄露会造成安全问题.
iOS中的Security.framework提供了对RSA算法的支持.这种方式需要对密匙对进行处理, 根据public key生成证书, 通过private key生成p12格式的密匙.


1.创建文件下 Demo
cd  Demo
openssl genrsa -out private_key.pem 1024
// 该命令会生成1024位的私钥，
//echo "create certification require file: rsaCertReq.csr"
openssl req -new -key private_key.pem -out rsaCertReq.csr

//echo "create certification using x509: rsaCert.crt"
openssl x509 -req -days 3650 -in rsaCertReq.csr -signkey private_key.pem -out rsaCert.crt


subject=/C=CN/ST=Sh/L=SH/O=paiwogou/OU=paiwogou/CN=paiwogou/emailAddress=li.lian.you163@163.com

//echo "create public_key.der For IOS"
openssl x509 -outform der -in rsaCert.crt -out public_key.der

//echo "create private_key.p12 For IOS. Please remember your password. The password will be used in iOS."
openssl pkcs12 -export -out private_key.p12 -inkey private_key.pem -in rsaCert.crt











