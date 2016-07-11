Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abbd8e0c
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 18:58:50 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Quan Zhou <quanzhou822@gmail.com>
In-Reply-To: <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
Date: Mon, 11 Jul 2016 17:21:02 +0200
Message-ID: <87d1mktd41.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason--

On Mon 2016-07-11 12:18:43 +0200, Jason A. Donenfeld wrote:

> You can build the module with "make debug", and then you'll get lots
> of helpful debugging information in your dmesg.

Would it be possible to log more when the kernel is in a more vebose
mode, or to have a module parameter that increases the logging?  Not
having to rebuild make it simpler for people experimenting with
pre-packaged (or dkms-built) modules to just "enable debugging", which
might produce more verbose problem reports.

Or does anyone know of the simplest way to encourage dkms to build a
specific module in debug mode?  If so, i could try to ship a
wireguard-dkms-debug package (which Conflicts: wireguard-dkms and
Provides: wireguard-dkms) as an alternate option for people who don't
want to do the build themselves.

        --dkg
