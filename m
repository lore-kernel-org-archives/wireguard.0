Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7EFC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Nov 2018 14:16:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B682241E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Nov 2018 14:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B682241E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2a353e8;
	Mon, 12 Nov 2018 14:10:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76cc4a3f
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 14:10:43 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b1ad6fb
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 14:10:43 +0000 (UTC)
Received: from fifthhorseman.net (ool-6c3a0662.static.optonline.net
 [108.58.6.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id 7979DF99B;
 Mon, 12 Nov 2018 09:15:49 -0500 (EST)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id C5B19207B0; Mon, 12 Nov 2018 17:07:44 +0700 (+07)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Laszlo KERTESZ <laszlo.kertesz@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Debian unstable Pin-Priority too high in Installation
 documentation
In-Reply-To: <CANcuY=rLL1mX2FLHgL6z2fDcrRE9pbHT50MnOcEi8TsGGWDo+w@mail.gmail.com>
References: <CANcuY=rLL1mX2FLHgL6z2fDcrRE9pbHT50MnOcEi8TsGGWDo+w@mail.gmail.com>
Date: Mon, 12 Nov 2018 05:07:41 -0500
Message-ID: <87zhuea9si.fsf@fifthhorseman.net>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============3849396753215158836=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3849396753215158836==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Sun 2018-11-11 04:56:28 +0200, Laszlo KERTESZ wrote:
> On the Wireguard site the Debian installation Pin-Priority is at 150 - this
> is too high because the official Backports (Stretch-Backports currently)
> has a default of 100. This makes certain packages such as kernel images to
> be pointed to Unstable instead of Backports.
> I believe a number such as 90 should be better choice.

I agree with Laszlo that 90 would be a better choice for pinning
unstable.

thanks for the fix, Laszlo!

       --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTTaP514aqS9uSbmdJsHx7ezFD6UwUCW+lQ7QAKCRBsHx7ezFD6
U2ZSAP9krto65NpUu+Zf3h637cgoyvjegibwR85KKvIRNIHRtAD+JIttmqSvdGIL
R8ABMOrW0sQvkk6D7hhIcpLXtmBjlg8=
=Py3v
-----END PGP SIGNATURE-----
--=-=-=--

--===============3849396753215158836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3849396753215158836==--
