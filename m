Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F698C2D0ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123B120733
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123B120733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31486a30;
	Mon, 30 Mar 2020 02:10:45 +0000 (UTC)
Received: from claranet-outbound-smtp06.uk.clara.net
 (claranet-outbound-smtp06.uk.clara.net [195.8.89.39])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c24127d
 (TLSv1.2:AES256-SHA256:256:NO) for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 18:48:15 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:32934 helo=[172.16.2.123])
 by relay06.mail.eu.clara.net (relay.clara.net [81.171.239.36]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) id 1jEHMB-0001Yh-LQ 
 (return-path <barry@barrys-emacs.org>); Tue, 17 Mar 2020 18:54:28 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Question for wireguard events
From: Barry Scott <barry@barrys-emacs.org>
In-Reply-To: <5b5318f7-415b-e07b-5afd-a1e9b3292432@wut.de>
Date: Tue, 17 Mar 2020 18:54:26 +0000
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F86D785-5A81-4836-8B71-8C3F2F06C630@barrys-emacs.org>
References: <5b5318f7-415b-e07b-5afd-a1e9b3292432@wut.de>
To: Simon Lindhorst <s.lindhorst@wut.de>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:43 +0200
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



> On 16 Mar 2020, at 12:43, Simon Lindhorst <s.lindhorst@wut.de> wrote:
>=20
> Hi,
>=20
> is there a way to get events for wireguard?
>=20
> I want to show in an gui which clients are connected or not. For that =
I could poll the wireguard netlink socket. The better way in my opinion =
is to wait for events, so no polling is required.

I don't know if there are events that you can hook, others understand =
this better then I do.

What I did is:

	wg show all dump

I extract the latest_handshake field out of the dump for each client.
I know the client_keepalive from my client database.

Then I do this calculation based on information from people on =
#wireguard IRC:

        ago =3D now - latest_handshake
        # handshake is every 2 minutes + keep alive + 2 (error margin)
        down_after =3D (60*2) + client_keepalive + 2

        if latest_handshake =3D=3D 0 or ago > down_after:
            state =3D 'Down'
        else:
            state =3D 'Up (%d%%)' % (100-(ago*100//down_after),)

I only have a handful of clients so this is fast for me. I show the =
results
in a web page that shows the status of my firewall.

If I was going to scale this to large size I'm use the netlink interface
so that I only fetched the perr info I needed.

Barry


>=20
>=20
> Best regards,
>=20
> Simon
>=20
> -- Unsere Aussagen koennen Irrtuemer und Missverstaendnisse enthalten.
> Bitte pruefen Sie die Aussagen fuer Ihren Fall, bevor Sie =
Entscheidungen auf Grundlage dieser Aussagen treffen.
> Wiesemann & Theis GmbH, Porschestr. 12, D-42279 Wuppertal
> Geschaeftsfuehrer: Dipl.-Ing. Ruediger Theis
> Registergericht: Amtsgericht Wuppertal, HRB 6377 Infos zum =
Datenschutz: http://www.wut.de/datenschutz
> Tel. +49-202/2680-0, Fax +49-202/2680-265, http://www.wut.de
>=20

