Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5808cc8c
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 21:48:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7144709
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 21:48:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d71a5029
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 22:07:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d6c0881d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 22:07:41 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b1so9226279oih.4
 for <wireguard@lists.zx2c4.com>; Mon, 25 Sep 2017 15:16:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE2xwxm2k_zMLdtQS3yQFUF-47O0thBKUtDfnUMLcZjKMnZcaQ@mail.gmail.com>
References: <CAE2xwxm2k_zMLdtQS3yQFUF-47O0thBKUtDfnUMLcZjKMnZcaQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Sep 2017 00:16:33 +0200
Message-ID: <CAHmME9q2-3SNzxT9VPb=8QmB3=CzkBbmEe+Xh3dhSr8Yw_kvfw@mail.gmail.com>
Subject: Re: Key generation in Java
To: Christian Colic <colic.christian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Fun school project!

Step 1:
Copy and paste this file into your java project:
https://raw.githubusercontent.com/rweather/noise-java/master/NoiseJava/src/com/southernstorm/noise/crypto/Curve25519.java

Step 2:
wg genkey is:

       import java.security.SecureRandom;
       ...
       SecureRandom random = new SecureRandom();
       byte privateKey[] = new byte[32];
       random.nextBytes(privateKey);
       privateKey[0]  &= 248;
       privateKey[31] &= 127;
       privateKey[31] |= 64;

Step 3:
wg pubkey is:

       byte publicKey[] = new byte[32];
       Curve25519.eval(publicKey, 0, privateKey, null);

Step 4:
Convert privateKey and publicKey to/from base64.
