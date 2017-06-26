Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 184e1498
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:41:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ef64d9f
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:41:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5565f395
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:55:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 288e2f27
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:55:09 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id y47so64238409oty.0
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 02:57:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Jun 2017 11:57:56 +0200
Message-ID: <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
Subject: Re: making wireguard work on RHEL7/etc.
To: wireguard@wut.to
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

Excellent!

Indeed let's roll with that. Perhaps something quite specific, though, like:

#if RHEL_RELEASE_CODE <= RHEL_RELEASE_VERSION(7,3)

If you want to reroll your patches around this, in a really clean way,
and submit them using git-send-email to the list, I can do a proper
review and we can get this merged.

Jason
