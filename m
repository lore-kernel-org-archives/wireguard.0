Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 216473d7
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:50:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a81684c8
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:50:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33758c6f
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:50:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2b3c9807
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:50:47 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b126so673348821oia.2
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 15:00:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170108225732.GC9445@tuxmachine.polynome.dn42>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
 <CAHmME9p0wV=cVME+3vQ5tenWOBc5SQWicKevXOwf2N7O2R225Q@mail.gmail.com>
 <20170108225732.GC9445@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Jan 2017 00:00:17 +0100
Message-ID: <CAHmME9pSJ3gsAUdNhk_Lt-QzOf6+eS=cay_Chq8YpdcaZJbCsA@mail.gmail.com>
Subject: Re: Multiple Endpoints
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Jan 8, 2017 at 11:57 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> Please read Emmanuel's email more carefuly before being so assertive.
> His use-case was a client behind a stateful firewall, so if the server
> changes its IP address, roaming will not work.

I understand that use-case. And as I said before, most UDP stateful
firewalls allow changing remote IPs, so long as the dport/sport remain
the same.

> I merely pointed out that a stateful firewall is similar to a symmetric
> NAT, that is, both would cause issue with peer roaming.

Are you sure about this for UDP? I did a bunch of tests several months
ago, and was able to punch holes in a variety of stateful firewalls
with changing remote IPs.
