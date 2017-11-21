Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f610d3c1
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:59:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 738f82cf
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:59:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb04b51d
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:59:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4012a342
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 09:59:17 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id e142so8143941oih.2
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 02:04:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
References: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 11:04:15 +0100
Message-ID: <CAHmME9pokFyve7=UueDYYPvCU4LK-eQ4f0=GdZ7AocR6=BHGbQ@mail.gmail.com>
Subject: Re: new bug on armhf
To: =?UTF-8?B?0KDQvtC80LDQvSDQk9Cw0LLRgNC40LvQvtCy?= <kogeler@gmail.com>
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

Hi Roman,

Thanks for the feedback. I'm surprised to see this again, since I've
tried to consistently use .thumb annotations in the assembly. I'll try
to take your config and reproduce it somewhere. Probably I should just
order a single board computer for this, but I think I'll try to kexec
on scaleway first.

Jason
