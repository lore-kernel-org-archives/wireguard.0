Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9DAC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 13:04:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53D72083D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 13:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53D72083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=student.tuwien.ac.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd24db36;
	Tue, 6 Nov 2018 13:00:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59119ae5
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 13:00:28 +0000 (UTC)
Received: from mail1.student.tuwien.ac.at (mail1.student.tuwien.ac.at
 [193.170.73.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e2b1aa4
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 13:00:28 +0000 (UTC)
Received: from uni (213-47-131-124.cable.dynamic.surfer.at [213.47.131.124])
 (authenticated bits=0)
 by mail1.student.tuwien.ac.at (8.14.7/8.14.7) with ESMTP id wA6D4hp8018606
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Nov 2018 14:04:44 +0100
Date: Tue, 6 Nov 2018 14:04:43 +0100
From: Fabian =?utf-8?Q?Gr=C3=BCnbichler?=
 <fabian.gruenbichler@student.tuwien.ac.at>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: wireguard dkms systemd
Message-ID: <20181106130443.67eb7j2c2adfq6i2@uni>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
 <87o9b5frsn.fsf@fifthhorseman.net>
 <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
 <87sh0gdomi.fsf@fifthhorseman.net>
 <20181105112744.zxe3kro53f2ez66a@uni>
 <87bm72ekuv.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bm72ekuv.fsf@fifthhorseman.net>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Nov 06, 2018 at 02:16:56PM +0700, Daniel Kahn Gillmor wrote:
> On Mon 2018-11-05 12:27:44 +0100, Fabian Gr=FCnbichler wrote:
> > FWIW, I'd like to see some variant of transparent reloading integrated
> > into the Debian packages (even if disabled by default).
> =

> if you want to propose a postinst that addresses the two other concerns
> (i.e. using a debconf question, and not prompting the local admin if the
> local package was able to successfuly handle the reload), i'd happily
> review it, and include it if it looks good.

if nobody beats me to it, I will - but no time until the weekend. do you
prefer patch here or via BTS or MR on salsa or BTS referencing MR? ;)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
