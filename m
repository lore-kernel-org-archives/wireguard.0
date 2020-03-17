Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7B0C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC0E20733
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC0E20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42fa6d07;
	Mon, 30 Mar 2020 02:10:44 +0000 (UTC)
Received: from claranet-outbound-smtp05.uk.clara.net
 (claranet-outbound-smtp05.uk.clara.net [195.8.89.38])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6f98495
 (TLSv1.2:AES256-SHA256:256:NO) for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 18:12:00 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:2583 helo=[172.16.2.196])
 by relay05.mail.eu.clara.net (relay.clara.net [81.171.239.35]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:RSA_AES_256_CBC_SHA256:256) id 1jEGn7-0003yg-HL 
 (return-path <barry@barrys-emacs.org>); Tue, 17 Mar 2020 18:18:14 +0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: Adding comments for a peer through wg set
From: Barry <barry@barrys-emacs.org>
In-Reply-To: <20200317015201.GA384449@riseup.net>
Date: Tue, 17 Mar 2020 18:18:12 +0000
Cc: wireguard@lists.zx2c4.com
Message-Id: <CB283B6E-6429-4212-B23A-60CF8AFC10CD@barrys-emacs.org>
References: <20200317015201.GA384449@riseup.net>
To: Sukhbir Singh <yamailinglist@riseup.net>
X-Mailer: iPad Mail (17D50)
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:42 +0200
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



> On 17 Mar 2020, at 17:28, Sukhbir Singh <yamailinglist@riseup.net> wrote:
>=20
> =EF=BB=BFHi,
>=20
> When adding a new peer through `wg set', it seems like there is no way
> to include comments in the parameters. To solve this, the hack I use
> involves making sure SaveConfig is set in wg0.conf, adding the peer,
> `wg-quick save' and then appending the desired comment to the end of the
> wg0.conf file. This helps me add the peer without taking down the tunnel
> and also saves it to the config.
>=20
> Is there a better way? Note that I tried adding the comments to the
> different parameters (using "#") but it didn't work as expected.
>=20
> What's the reason for adding comments? So as to keep some notes about
> the peer I added, like "[Peer] ... # laptop config". So if there is a
> better solution for key management, please do share.

My solution to this problem is to maintain my own files and generate
the server wg0.conf from them. I also generate the clients wg0.conf
from the same data. I manage the allocation of IP addresses automatically.

Then the things that you are using comments for can be key/value
pairs in thoses files. For example I have a friendly name for each peer.

Barry






>=20
> Thanks.
>=20
> --=20
> Sukhbir
>=20

