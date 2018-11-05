Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D273FC0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 15:48:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D416D2085A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 15:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D416D2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=student.tuwien.ac.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9245d16;
	Mon, 5 Nov 2018 15:43:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1587ac36
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 11:23:38 +0000 (UTC)
Received: from mail1.student.tuwien.ac.at (mail1.student.tuwien.ac.at
 [193.170.73.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37716abf
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 11:23:37 +0000 (UTC)
Received: from uni (213-47-131-124.cable.dynamic.surfer.at [213.47.131.124])
 (authenticated bits=0)
 by mail1.student.tuwien.ac.at (8.14.7/8.14.7) with ESMTP id wA5BRiSe027705
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 5 Nov 2018 12:27:46 +0100
Date: Mon, 5 Nov 2018 12:27:44 +0100
From: Fabian =?utf-8?Q?Gr=C3=BCnbichler?=
 <fabian.gruenbichler@student.tuwien.ac.at>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: wireguard dkms systemd
Message-ID: <20181105112744.zxe3kro53f2ez66a@uni>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
 <87o9b5frsn.fsf@fifthhorseman.net>
 <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
 <87sh0gdomi.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sh0gdomi.fsf@fifthhorseman.net>
X-Mailman-Approved-At: Mon, 05 Nov 2018 16:43:42 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Nov 05, 2018 at 01:28:37PM +0700, Daniel Kahn Gillmor wrote:
> On Sun 2018-11-04 16:35:07 +0100, Jason A. Donenfeld wrote:
> > FWIW, Ubuntu users got confused with reloading the kernel module (let
> > alone systemd's view of units), so we wound up adding something a bit
> > strange to the postinst:
> >
> > https://github.com/EggieCode/wireguard-ppa/blob/master/debian/wireguard-dkms.postinst#L36-L72
> >
> > Not sure that Debian would want to follow suite with such a thing though...
> 
> i like some of the ideas there, but i don't think i'd want it as-is, for
> at least a few reasons:
> 
>  * the administrator's choice mechanism
>   (/etc/wireguard/.reload-module-on-update) is rather idiosyncratic.
>   Using a single boolean debconf question is probably a better approach.
> 
>  * echoing suggestions to stdout to rmmod/modprobe just before actually
>    doing the thing seems like a recipe for it happening twice.  I think
>    i wouldn't make that prompt if the administrator has already asked
>    the system to do the upgrade.

Ack.

>  * i'm leery of the "systemctl daemon-reload" approach in particular, as
>    mentioned above.  if lots of packages did that in their postinst
>    they'd be interacting weirdly with each other during a multi-package
>    upgrade.

I don't see how reloading systemd units too often can cause any kind of
interference, and in fact debhelper already does this for both the
'restart in postinst' (default in compat 10+) and the 'stop in prerm,
start in postinst' (default in compat <= 9) mode - unconditionally, on
every upgrade of a package that ships an automatically (re)started unit.

random data point: on this system with 1606 maintscripts in place, 93
have some variant of systemctl daemon-reload in them (and 12 even have
multiple calls in one maintscript). on a server running Stretch, the
ratio is 72/597.

unnecessarily reloading does of course prolong the upgrade itself, but
since we can't easily tell that the unit has been modified, and not
reloading in case it has been makes the restart fail, the tradeoff of
always reloading on upgrade seems reasonable to me.

FWIW, I'd like to see some variant of transparent reloading integrated
into the Debian packages (even if disabled by default).

> thanks for the pointer though!

thanks for your work on wireguard in Debian :)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
