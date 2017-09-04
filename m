Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1601575a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Sep 2017 20:32:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e79f6ad
 for <wireguard@lists.zx2c4.com>; Mon, 4 Sep 2017 20:32:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0fac012
 for <wireguard@lists.zx2c4.com>; Mon, 4 Sep 2017 20:51:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7c15cd06
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Sep 2017 20:51:34 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id h70so11477491oic.1
 for <wireguard@lists.zx2c4.com>; Mon, 04 Sep 2017 13:57:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1504407150.3783820.1093515456.1E75D390@webmail.messagingengine.com>
References: <1504407150.3783820.1093515456.1E75D390@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Sep 2017 14:57:46 -0600
Message-ID: <CAHmME9pa55Qzjp8n=PhkxQDJr4hz9n-Gnnpv4u_zCeWYqctp0g@mail.gmail.com>
Subject: Re: Module verification failed
To: DANG Fan <dangf09@gmail.com>
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

https://wiki.ubuntu.com/UEFI/SecureBoot/DKMS
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1566221

Yikes. Not a very nice situation, but of course it's temporary, as the
problem will disappear once we merge to mainline.
