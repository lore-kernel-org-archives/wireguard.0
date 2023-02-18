Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C60C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Feb 2023 22:50:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7d8fb6b;
	Sat, 18 Feb 2023 22:47:19 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 71abe433
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Feb 2023 22:47:16 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id D08E020FB1;
 Sat, 18 Feb 2023 23:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676760416;
 bh=qJ0MgcoE586A2XSR1EI5pcj9X26lpjvE8a9RIsBCdlI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=hFrNT5VxVG8e6J1JtaoeUZCuw0fDLKfqrqNlGm00FE4k8MKhZNMXEBR/x13yaRDBq
 HCZhdT5kaPn/aBR5wHoIZq07UEhHTXTGeKbnWUNDn6QvF1rKJ40oSWo+5+it2Sp3pe
 e0/n9Svb7ogDXygCAW3O8cZMf/ihzR7a3EqToMBtDt8g5OiyqV1qwfPVuCvbcHIJtI
 CwcDf4XOUJCYhZiDcpZdzNVKxOoPyAw/00SDfvpISYXwtGw/z71SbfD1M2ffukZBD4
 DoYSzQ0a1ZXA1ee1+MqIH90k9M+ESLYjUmpZFFFVk7W7cvWoGqtIk1LBkctPfIfRIh
 wB71RZ+oUt+mg==
Received: by blind.localdomain (Postfix, from userid 1000)
 id CD41E13A11F1; Sat, 18 Feb 2023 23:47:15 +0100 (CET)
References: <87bklqd7vb.fsf@ungleich.ch>
 <CAHx9msc1cNV80YU7HRmQ9gsjSEiVZ=pb31aYqfP62hy8DeuGZA@mail.gmail.com>
User-agent: mu4e 1.7.26; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Omkhar Arasaratnam <omkhar@gmail.com>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Source IP incorrect on multi homed systems
Date: Sat, 18 Feb 2023 23:34:59 +0100
In-reply-to: <CAHx9msc1cNV80YU7HRmQ9gsjSEiVZ=pb31aYqfP62hy8DeuGZA@mail.gmail.com>
Message-ID: <877cwed218.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Hello Omkhar,

I tend to disagree. The problem is not the routing, but the selected
source address, which is independent of routing. To be more specific: as
there is BGP routing on all all interfaces, 147.78.195.254 is an
accepted IP address on any interface.

Best regards,

Nico

Omkhar Arasaratnam <omkhar@gmail.com> writes:

> This looks like an asymmetric routing issue from what you=E2=80=99re desc=
ribing, not a wireguard issue.
>
> You may want to look into policy based routing to address it.
>
> On Sat, Feb 18, 2023 at 15:54 Nico Schottelius <nico.schottelius@ungleich=
.ch> wrote:
>
>  Dear group,
>
>  I was wondering how wireguard [Linux kernel] or wireguard-go [FreeBSD]
>  are supposed to decide which IP address to use for replying?
>
>  I have seen both on FreeBSD and Linux that wireguard seems to use the IP
>  address of the outgoing interface, i.e. the one with the route returning
>  to the sender. However in multi homed situations, this can be wrong,
>  let's take this example:
>
>        19:57:24.607526 net1  In  IP 194.5.220.43.60770 > 147.78.195.254.5=
1820: UDP, length 148
>        19:57:24.608358 net2  Out IP 195.141.200.73.51820 > 194.5.220.43.6=
0770: UDP, length 92
>
>  The initiator sends from 194.5.220.43 to the receiver 147.78.195.254.
>  Wireguard then replies with the source IP of 195.141.200.73 instead of
>  147.78.195.254.
>
>  As the node is multi homed, the packet might leave through any of its
>  uplinks and thus return with a random (unexpected) IP address and will
>  not pass NAT rules on firewalls and finally be dropped. F.i. in above
>  example the firewall drops the packet from 195.141.200.73, because there
>  is no session entry for that.
>
>  I have observed this behaviour both on Linux 6.1.11 as well as
>  wireguard-go 0.0.20220316_8,1 on FreeBSD and in both cases the
>  connection will break depending on which active interface is taken as
>  exit.
>
>  I would argue that wireguard should by default invert the IP
>  addresses, i.e. switch dst=3Dsrc, src=3Ddst and then reply with that,
>  instead of adapting an interface specific address, or is there a good
>  reason for the current behaviour?
>
>  Best regards,
>
>  Nico
>
>  --
>  Sustainable and modern Infrastructures by ungleich.ch


--
Sustainable and modern Infrastructures by ungleich.ch
