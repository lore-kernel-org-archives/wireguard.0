Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5efcfb9b
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 13:03:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fba0bcb0
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 13:03:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81823cbd
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 12:40:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 94b9b18e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 12:40:11 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id l12-v6so1372276oth.6
 for <wireguard@lists.zx2c4.com>; Thu, 26 Apr 2018 06:04:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6e8c6b16-f131-6b45-9eee-f162a4f31099@attglobal.net>
References: <b110c9fb-fbd7-0e7a-31a7-bfec934ad058@attglobal.net>
 <CAHmME9ovmNCJ4501TDpvtu9doci1Z34jS9N88csgNskxq4QrRg@mail.gmail.com>
 <6e8c6b16-f131-6b45-9eee-f162a4f31099@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Apr 2018 15:04:49 +0200
Message-ID: <CAHmME9oiL35cdLnxat5nXGmaT8U+HoLg+YzEGDuZw43-etReEQ@mail.gmail.com>
Subject: Re: RX Errors from Android Peer
To: stunnel@attglobal.net
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

Hello Eddie,

Precisely what's happening here is that your device has various TCP
connections that are open _before_ you turn on the VPN. Then you turn
on the VPN, and now those prior TCP sessions try to continue over the
VPN, using the old source IP address. It takes a few seconds for
everything to time out, and for those TCP connections to be
reestablished with the right new tunnel source IP. In the meantime,
the WireGuard server gets packets using the old source IP, which of
course isn't correlated with that peer's allowed IPs, and so it
complains and rejects those packets. If it allowed them, that'd be a
security problem.

So, nothing to worry about.

Jason
