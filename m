Return-Path: wireguard@wut.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8a08c3b
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:09:29 +0000 (UTC)
Received: from opal.spod.org (opal.spod.org [217.135.32.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8246cbbd
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 09:09:28 +0000 (UTC)
Date: Mon, 26 Jun 2017 10:25:46 +0100 (BST)
From: wireguard@wut.to
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: making wireguard work on RHEL7/etc.
In-Reply-To: <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
Message-ID: <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jason A. Donenfeld wrote:

> Are you aware of any RHEL-specific defines I might be able to use to
> differentiate?

A quick look around found this, I think conditional code on RHEL_MAJOR is
probably the way to go, maybe "If KERNEL_VERSION() or RHEL_MAJOR then
<compat blah>"

$ cat /usr/include/linux/version.h

#define LINUX_VERSION_CODE 199168
#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
#define RHEL_MAJOR 7
#define RHEL_MINOR 3
#define RHEL_RELEASE_VERSION(a,b) (((a) << 8) + (b))
#define RHEL_RELEASE_CODE 1795
#define RHEL_RELEASE "514.21.2"
