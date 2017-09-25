Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de8f18e9
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 21:51:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0c44956
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 21:51:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed0653d8
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 22:10:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c288f18f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Sep 2017 22:10:55 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id i128so9219549oih.6
 for <wireguard@lists.zx2c4.com>; Mon, 25 Sep 2017 15:19:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q2-3SNzxT9VPb=8QmB3=CzkBbmEe+Xh3dhSr8Yw_kvfw@mail.gmail.com>
References: <CAE2xwxm2k_zMLdtQS3yQFUF-47O0thBKUtDfnUMLcZjKMnZcaQ@mail.gmail.com>
 <CAHmME9q2-3SNzxT9VPb=8QmB3=CzkBbmEe+Xh3dhSr8Yw_kvfw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Sep 2017 00:19:47 +0200
Message-ID: <CAHmME9rG-J79u-fpu4b97OLORPUsX0GhQpzaU3fQ=wV2HGLdrw@mail.gmail.com>
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

Oh, and wg genpsk (not genkey) is just:

       SecureRandom random = new SecureRandom();
       byte privateKey[] = new byte[32];
       random.nextBytes(privateKey);
