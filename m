Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2f06ff5
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 23:51:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a006aad4
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 23:51:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50c47466
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 23:49:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fcf6cd20
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 23:49:59 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id l15-v6so5557718oth.6
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jun 2018 16:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmL+SmFnHXTQTQ+PjYHei_HQ4bw5gQAasPnPve9uNUFaryFsw@mail.gmail.com>
In-Reply-To: <CAAmL+SmFnHXTQTQ+PjYHei_HQ4bw5gQAasPnPve9uNUFaryFsw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jun 2018 01:55:56 +0200
Message-ID: <CAHmME9rfLrgrw3dx4whc5NnGxp_LszwRU6qV+3JRLY4cF-Y-hA@mail.gmail.com>
Subject: Re: Is a hostname a valid value value for Endpoint?
To: jonathan@jonathanhult.com
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

The endpoint can contain a domain, yes.

However, the correct behavior is to look up that domain using the DNS
server that exists prior to turning on WireGuard. Otherwise you'd have
a chicken&egg problem with tunnel-only accessible DNS servers.
