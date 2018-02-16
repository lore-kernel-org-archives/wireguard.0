Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27d48727
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:19:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0021e31
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:19:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2264d14e
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:11:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50664860
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:11:00 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id p8so1228775otf.2
 for <wireguard@lists.zx2c4.com>; Fri, 16 Feb 2018 14:27:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHjFYUJqNB6AYTe1GO7pQr39ed6m6uO=pFo_wB_N=V2Tn1a5Kg@mail.gmail.com>
References: <CAHjFYUJqNB6AYTe1GO7pQr39ed6m6uO=pFo_wB_N=V2Tn1a5Kg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Feb 2018 23:27:00 +0100
Message-ID: <CAHmME9oD3duOhD7sZ7h7+gjU2+WhUgqKKMOmvb7kSypwg+9o3g@mail.gmail.com>
Subject: Re: Running WireGuard on embedded devices with older kernel versions
To: Jacob Schooley <jacob.schooley@gmail.com>
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

Hi Jacob,

Technically this could be done; there are other ways of hooking into
the networking stack other than the udp tunnel API. However, in
practice, my time is probably spent working for the future rather than
the past. Supporting 26 (!!) versions of Linux, back to 3.10, was
already quite the undertaking... But if you'd like to do this and send
some code upstream, I'll take patches. Take a look at src/compat.h for
some hints on how to proceed.

Jason
