Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec5ec6c1
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 15:05:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6d831f4
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 15:05:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0f160da
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 15:05:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 22f70e7b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 15:05:50 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id e142so8737987oih.2
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 07:10:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pokFyve7=UueDYYPvCU4LK-eQ4f0=GdZ7AocR6=BHGbQ@mail.gmail.com>
References: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
 <CAHmME9pokFyve7=UueDYYPvCU4LK-eQ4f0=GdZ7AocR6=BHGbQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 16:10:49 +0100
Message-ID: <CAHmME9q6K_yBMMrrSMvMJmTxtn0miyugOrR1FuUwe22wnsjVXQ@mail.gmail.com>
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

It took me all day to get a working configuration, due to a binutils
bug, but I finally reproduced it, and then fixed the bug. Can you grab
the latest git master `git fetch && git reset --hard origin/master`
and let me know if it works for you?

Thanks,
Jason
