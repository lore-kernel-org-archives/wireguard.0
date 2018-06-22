Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 518e2b69
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:30:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4702c4f
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:30:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4df821f2
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:28:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 931ae31a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:28:59 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id i19-v6so5742785otk.10
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jun 2018 18:35:11 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jun 2018 03:34:56 +0200
Message-ID: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
Subject: PostUp/PreUp/PostDown/PreDown Dangerous?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey list,

wg(8) is the main wireguard tool. It takes a fairly strict set of
inputs, and is supposed to perform acceptable input validation on
them.


wg-quick(8) is a dinky bash script, that is useful for some limited use cases.


https://medium.com/tenable-techblog/reverse-shell-from-an-openvpn-configuration-file-73fd8b1d38da
