Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8cc9d24
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:27:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df8896a2
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:27:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 939d0e54
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:03:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fe16bfb7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:03:33 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id j10-v6so9000141oii.12
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 12:27:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADX+UFiHhwCrWk3t5PARVbTh9EcMMe=TjdUkZuQ4450J2eYvBQ@mail.gmail.com>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <CAHmME9racrutSPmM_Oy6eHAx3B=ah1=xzchzb_msZ5F9Zf-rGA@mail.gmail.com>
 <CADX+UFjjqvemqD38xvpa3GAFBWm2=39sb7dfBnvuAaQkzqwdRQ@mail.gmail.com>
 <CADX+UFiHhwCrWk3t5PARVbTh9EcMMe=TjdUkZuQ4450J2eYvBQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Apr 2018 21:27:27 +0200
Message-ID: <CAHmME9rx25_zK+6QkgRfDjHE5Hy_T7tuyn_C=K5RSBSU0W2iwA@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: Ximin Luo <ximin@dfinity.org>
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

Hey Ximin,

Nice to see that you're thinking through these issues in a concrete setting.

For a while I had some notions about allowing WireGuard to pop up
initiaton messages from unauthenticated peers to userspace for userspace to
then validate in one way or another asynchornously, followed by userspace
adding that peer's key to the list of peers (or not), and initiating the
handshake back the other way reusing the initial UDP port. This wouldn't add
that much complexity and I think it'd be fairly reliable. However, I've held
off on implementing it because I'm skepical that people would actually use it
in a way that makes sense. For example, in your case, you already have some
other aspect of the protocol which seeks to exchange this information; in
that case, doing the exchange there makes most sense, since you can morph and
change that for your particular requirements. In other words, I like the idea
you presented in your follow up email. Does that seem like a okay solution for
you? Or do you think you do have a compelling reason for adding the above
semantics?

Jason
