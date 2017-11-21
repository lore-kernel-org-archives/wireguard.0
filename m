Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d9f67a9
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 10:00:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3f760c7
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 10:00:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fde751e
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 10:00:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2abcb1ac
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 10:00:31 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id t79so10061285ota.3
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 02:05:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171121093435.GA4278@matrix-dream.net>
References: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
 <20171121093435.GA4278@matrix-dream.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 11:05:29 +0100
Message-ID: <CAHmME9pThrsy-mPGx3ngZm5ZcpXOny56qVxTO5qCdquO+uXESw@mail.gmail.com>
Subject: Re: new bug on armhf
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
Content-Type: text/plain; charset="UTF-8"
Cc: =?UTF-8?B?0KDQvtC80LDQvSDQk9Cw0LLRgNC40LvQvtCy?= <kogeler@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 21, 2017 at 10:34 AM, Ivan Lab=C3=A1th
<labawi-wg@matrix-dream.net> wrote:
> I don't know much about arm modules, but is seems
> like a generic module-kernel mismatch.

Nope. This is some wild consequence of all that new hand-rolled
assembly I introduced, and the interworking of thumb and arm
instructions/addresses. I'm trying to fix it now.
