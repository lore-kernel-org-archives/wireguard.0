Return-Path: <SRS0=rROn=AC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ED2C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 12:57:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D836B248E7
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 12:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=53c70r.de header.i=@53c70r.de header.b="FwdCmrzq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D836B248E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee9a6b27;
	Sun, 21 Jun 2020 12:38:47 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [5.181.49.190])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 75f49ed5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 12:38:44 +0000 (UTC)
Date: Sun, 21 Jun 2020 12:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de 666DB407EA07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=53c70r.de;
 s=default; t=1592744240;
 bh=+YXDQnj4OJVb3tI8U5sVmzMgca9BEbNhJFciqVz2SW0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FwdCmrzqd8+MEtpxmCWfwQmz+GEin8rNPL6JX0sfwi4SYVV9QMHzbvBdfj5wdtP2u
 vCLKYqloM1d6+9e08jmKbc5YHGxu/TKgtwBWf2R2c4H5fBUzFlBR1ZA6DumhoeGJFC
 LtzLwgtb+6ypUpG6UW6AXE5j5+1zy15HFw9vMRs8=
From: Silvan Nagl <mail@53c70r.de>
To: Jean-Dens Girard <jd.girard@sysnux.pf>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <66f204e5-19de-4ad8-adab-019700fa2c4d@53c70r.de>
In-Reply-To: <975a5f77-5c7e-dcfe-6bbe-d4b6e2c5e379@53c70r.de>
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
 <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
 <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
 <975a5f77-5c7e-dcfe-6bbe-d4b6e2c5e379@53c70r.de>
Subject: Re: Kernel Panic after updating Kernel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <66f204e5-19de-4ad8-adab-019700fa2c4d@53c70r.de>
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

For me it was.
Elrepo work's fine for me I had the same issue before when I used the old s=
eparate dkms build from the WG repo.

21 Jun 2020 14:45:44 Jean-Dens Girard <jd.girard@sysnux.pf>:

> Le 18/06/2020 =C3=A0 10:11, Jason A. Donenfeld a =C3=A9crit=C2=A0:
>> On Thu, Jun 18, 2020 at 2:10 PM Jean-Denis Girard <jd.girard@sysnux.pf> =
wrote:
>>> I cannot reboot now, I will let you know how it goes later.
>=20
> Reboot with newer kernel and latest wireguard=C2=A0 still hangs.
>=20
>> Oh, in your case, you appear to be using the dkms package instead of
>> the elrepo package.
>=20
> Is that a problem?
>=20
> Thanks,
>=20
> --=20
>=20
> Jean-Denis Girard
>=20
> SysNux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Syst=C3=A8mes=C2=A0=C2=A0 Linux=
=C2=A0=C2=A0 en=C2=A0=C2=A0 Polyn=C3=A9sie=C2=A0 fran=C3=A7aise
>=20
> https://www.sysnux.pf/=C2=A0=C2=A0 T=C3=A9l: +689 40.50.10.40 / GSM: +689=
 87.797.527
>=20
