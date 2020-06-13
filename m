Return-Path: <SRS0=qqbH=72=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B8DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Jun 2020 15:34:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D08D2078A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Jun 2020 15:34:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="iYVWbOsb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D08D2078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48b9d74e;
	Sat, 13 Jun 2020 15:16:59 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8783468e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Jun 2020 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1592062470;
 bh=jhwdp+q4dyDzrxIYt/K9rNC9fQ+GgWE2Vn/YMx6ZqoI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:Subject;
 b=iYVWbOsbSJ3eIgIGHYWBwFklNoZUjtJLFWIWSDNFTd0NZ5/IAGhIgLHLalPyDm+Zy
 zqVzw3ZRxxU1EN78ZQi8URmRM1phqZDqDepAwTDqSpqkMSSHE0YocoBL/8aWv9QdiB
 1CGSEbhW7/40uoe3s4F8r3YV5zsB6NDHbi96g3SQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Martins-Air.home.lan.mail ([176.198.17.117]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MVeI2-1jIXBK1EHM-00RaR5; Sat, 13 Jun 2020 17:34:30 +0200
Date: Sat, 13 Jun 2020 17:34:23 +0200
From: Martin Jurasik <martin.jurasik@gmx.de>
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <etPan.5ee4f204.65c247b6.cb30@gmx.de>
In-Reply-To: <CAHmME9rvznrXSDNY5VdTzX5CtcPwUumTAsT4Y+tqMNfOraTo+w@mail.gmail.com>
References: <etPan.5ee21f64.7c09ac86.1105b@gmx.de>
 <trinity-bcc1ea44-937b-4b1f-a979-acf971aac3ac-1591986145982@3c-app-gmx-bs62>
 <CAHmME9rvznrXSDNY5VdTzX5CtcPwUumTAsT4Y+tqMNfOraTo+w@mail.gmail.com>
Subject: Re: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Provags-ID: V03:K1:Ctvv8Rd55im5QSfPWlrR3llNYJqklCmFLm5aJ8unVxW9KyvkCim
 oqPiwhBdH2LxGKX0Cbqo+voNUnq7oF8o/XfXG70fXJEYp9nuGTyIzK1THV7J5n1CDblhunX
 axMKbVqHVPmhrjF+dDML6hWEW9GblzQHvjKJCABgIxewKq9Oapc8jr9qonTuN2mg/B5YTpS
 PLXvRZG0keLYNGwqVJRYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BoHrEnZZb4c=:KVkJmZpm5MxpAnZUzaJ9EG
 CO89JWkoFvHHPsXEkR4qVnvCKw/ENz99sYOW6UNIiwq4YohqEQyytfxwsyQgUuL0VY8SpSDWs
 KvJrW83wOWf0U1RrRaQWgSAFhIPYU4LuwIS/38h0UDbyiUX6IxOQP+Q48+csjbX9zZB2jrV5y
 FF4siv4Ohpkl7VBnYwErSLSnbMPvxgaLrw2NUmOVUejre4fm1aR6dZdlVmN9qQBnXoaJW0s/y
 eUvKDUPUhIVuqY2DJXqpvb/+U/t+ua0gq+3GJy24A5e4Aoz/J1c6xdmJBf790L/PSZKNFgbYO
 gtJl8rh6IBXJx4b8B9eHNkeBs/NFebqIILO4+LtRC/Cab1kUEiFaIssYbXccFpXXD2AP9uXrP
 +kS1hk9y+1sPCescWqTsHqVHmp1OYr0CYF2NopJxwaXTKdW+DGp9mR3rFR+Exw69K7lm0KaZb
 p0d4lZpwSskqqFcbcqEiNVWYE2PO4FT2fU5R/XYAbZG/z0XSqy5QoxTDUKbRkdXbFGu/u76Ab
 /8hkKupSKDMojhqkSdcMqTPmjOH9QI5QpvT2I9N/CSEOz4t1ZyDSAXY3nwt5/Uo5RYXYF1YUS
 hbt+RmXQ6U6h/eyq99D3FkJ0eiTxWrV2VdK3jpbTpylo5JWn4UOpWt4zYc3/2VuptzuxvSTaC
 /aYClX5bs9BICGxlE20Z/C7yU2BiEpgSho+EfvIaqq4cUcZ5RSWrEEJX9KS1rTsrtXroXmcil
 iSn5QqMwa8kgOkZFfQxDkCV5XwE1U9MWEJuA5AQuhy5xbwSN3YZRFmcN71HJ/ZK8MH3OwqcgG
 0QaJn4FDfd/j0Nv7l/kwE1JZ6iekZomrQB1dBe1s01uIQ6IlEnkpHfuby6safE0S4hA4MIfMY
 OFXQfVdkIUSaL1OgCJ3VJSlI11XPysqfzVjlmFebwdPbwwZvamflBTc/h5e6widPKoDdtUulQ
 x0xPX3tLMOKR8QSbYvHFuCLDk0f0zoGD/pHMg60/X+5jOuqrQfucwiyaVyKFSlMmAq0SodSJt
 olGEcdDvtAgmnPoTQscPXfw8PSckQpvEsauUpxSRwbA76gar85VEBbDbghq4DFntyjWp+U95P
 n07fHQVhpSjkZV6reL0bryXutbwoOPGuXQ+RADH8Z6STLQeFncOZWDvJwMvgHeeFwWavgW8MM
 mzhhVC3MhHtGDyS9ZjIKseX68v/JbLHl7Eiie38GMSX9bGE8HiIn5Q6F9lpoh8+ONPF+OUhWu
 aVnKlgheIm4keYbQm
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

That did the trick. Thank you very much=21=C2=A0




Am 13. Juni 2020 um 07:47:18, Jason A. Donenfeld (jason=40zx2c4.com(mailt=
o:jason=40zx2c4.com)) schrieb:

> Remove the 4.15.0-101-generic kernel, and then try again.

