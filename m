Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c86334df
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:22:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fd1a684
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:22:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 607361f8
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:22:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4310c74
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 19:22:05 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id u10so7253742otc.12
 for <wireguard@lists.zx2c4.com>; Mon, 13 Nov 2017 11:26:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALpTdxkEn6yM3b20Qm9KAGqmEH=9kiFhCGxkBAeuEwrxj1o4uQ@mail.gmail.com>
References: <CALpTdxmmm9PwtFEZ7bwHTvCcfB5VEpLTnHi0E-z3skSJvSdSuw@mail.gmail.com>
 <CAHmME9obe3j1suYKxFUHbCBHE7snQ+AtVFbjikv8rnf=m5Gc5A@mail.gmail.com>
 <CALpTdxkEn6yM3b20Qm9KAGqmEH=9kiFhCGxkBAeuEwrxj1o4uQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Nov 2017 20:26:05 +0100
Message-ID: <CAHmME9pWjzkvSQxq+kjx5vQZYQD1JJyrfymTfFJc+kPScLQVRA@mail.gmail.com>
Subject: Re: bug on armhf
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

Thanks for the configuration. Could you try this commit, and tell me
if it fixes the problem for you?

https://git.zx2c4.com/WireGuard/commit/?id=921c3eb23009558fdd4a64c36c379b7a8dc6b22f

Regards,
Jason
