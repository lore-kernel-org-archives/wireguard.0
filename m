Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960FFC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 13:49:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F672078E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 13:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="kyrO/H75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F672078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc8f1336;
	Mon, 4 May 2020 13:37:32 +0000 (UTC)
Received: from sonic303-24.consmr.mail.gq1.yahoo.com
 (sonic303-24.consmr.mail.gq1.yahoo.com [98.137.64.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e7635b5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1588600192; bh=Yoty8oMAvJw7Ebu9+CsXu8XgBxP71M5fvzn1X2JACgo=;
 h=Date:From:Subject:To:References:In-Reply-To:From:Subject;
 b=kyrO/H75SpA11TZHXFBV6jUQo0lsx4Ae4GliQmty+nvWa2b0UlQP6OKW4l5Qwo6fDmIAZ66gcLTokOIl0d2eIFeuZKzz6QINOZKxZBWcRGXRDFx4lVAij+1K7OJYc+uAxT8vXJBV/xunyoQ2xyfguxpe7B3XwT3lW6UANqxvwjBXumg4ZAIpISNvdALqHHOZhqxzV34wERN4lZFUBPYehJ/jiV9fERaufeC8nlNYF3+PZOVmUCG+hLGproR8PYnOtsi8vBPS9WEwT2C0w6ljJK3ZFeZ8q95FXaa0Z0Orf1teOS9r98PU/jjOYFiLij/pdw77ffIKr4ySYJrVDylLXg==
X-YMail-OSG: x.P3DzwVM1k3g3AUki6evUXw_I_cPN87x6Or4PFuhQ2HS18XMz6CUpFhyTPr67Q
 E4vGP9xivOaQf6pXz1ERGkKmJA24Slx01OV6D2EI1RswL6wv3VkG60GaJr4NSVG6j1G_jIqMGGx7
 WzaJnuL.PX.0qyugD0Q6amNKqgF2lFelJBy2GKUGZmUdkjR0dHtVFO1s8NUqEHF298F8U5sgzTeU
 L1Tbqq.xxGUfghko59uoEJbGr35vOQP8Rf8.4OZ8YVgQxEmIWvzxcAmLvA9X6lQmToKcgZGJ04rR
 mc90hGsxi8h3INcG1GZLAKSBVXl2YQObRaXkqO_3BoBOe.0KWPyXB.8QkeaOAJg.dympai46Ni2Y
 dp79t9UkfvUz_CAR.rDxiZPG2bOszHemd4W949hY0vkrD7kNi.XhXkLPgwvP_41v6y8g5ELnUeGk
 EczYLHJ2E9gjGcXAD8myaEJ7E7VCaoNBTw5I6B99WRFdf5m660dbD.Lsl2naqJupD_mQmexoaAJI
 _z.VczIaPapuPRcugcxAlrBadrnO2cVvV.dUeTkdgjNn9qs11Kj.cpnjJ20a8BePVh7F0Zb6Q4fT
 OIDk08tv.Xe4oLvAHKTBMXzHyrTXsJcmQJKq5yDIXd5zUZ1GPbtcRa5BwR9vmFbhKydEN5Zp_ON1
 P3pIB3ldg5BOWADxbsWY0qJQ.LHK.yIjapPbw3qH3NGomtIkXeT1a8kqTf7GQm45AbXkNpsfSUDN
 pPmbLjZGoseuEf3RK5mHzdxd5fEzJYgBcQyzsjoHAFguHra7m2j6p2OqWOuHKIF1NwkHPzxXD9jc
 witD_WRTuqYGgaQy_dEzP8J3ECBUtJ0SMJmY65g82qX8yeLtbVFHbG_O0TU3K7E2bkHciHjMdozd
 r_ha.SgX_VtI4OFl82029d0NHaywZ7gIRnOm7cb35gjKDy0TjJhJKLLJQPJpcb5CFKRik_bNSrBr
 jyKqgnl_Ks06N_rIjnBw1j040bkLh7P_qF8P.lkSwhsVSl12LqFMl_w0GVkr7E0APLIFCU_OUZvX
 FD.zYYNIeJ6yc4Eb7YViEmTxT_ay6HbaVKtyPdV2LOjAHy4c68WkJEl.oVrsNAK_5gVeTcy36oJC
 5hgqj__OZy7p3hxi3A7x2ylqiCOdiCKdXnBTFLdXxCafyy_HuJ7FPH5tChwIUqCh3AmyXOrVli44
 YKnlJnAentImfRgwD9.S8jmG1fMH137C.0NRQunt8bZKjjy1ncqiBalPBoABlcAM0GOFx_2o6x63
 fOmA_zyYgoMnSSPPqKKEUZu9rptb.II3etqaP8EXby7G8fASYbdqELyxCxOJc.3q7C076Y6fSNXI
 _w._spEUxYpGTJ9G6jD_YPTK3KamZdnj37MmEee6gXqV2o.4whQYlj2NJF71kvVV0kqmauRmVCLA
 4lo30.uc-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Mon, 4 May 2020 13:49:52 +0000
Received: by smtp417.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 3bbac88628e1907088323d94b8756fbf; 
 Mon, 04 May 2020 13:49:47 +0000 (UTC)
Date: Mon, 04 May 2020 09:49:43 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: soft lockup - may be related to wireguard (backported)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Wang Jian <larkwang@gmail.com>,
 wireguard@lists.zx2c4.com
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
 <CAHmME9oNus499EVFHVfLNjbOhU+vOV4P7R7USCm1ycNH2e0apA@mail.gmail.com>
In-Reply-To: <CAHmME9oNus499EVFHVfLNjbOhU+vOV4P7R7USCm1ycNH2e0apA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1588599653.habtnvnvne.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15756 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
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

Excerpts from Jason A. Donenfeld's message of May 4, 2020 1:26 am:
> Are you routing wireguard over wireguard, or something interesting like t=
hat?
>=20
> Is ipsec being used?
>=20

This "DN2800MT" looks like an Atom board from 2012; are you trying to=20
run a very large bandwidth through it? I think it's plausible that=20
buffering could cause a large enough chunk of work for a slow CPU that=20
the kernel could erroneously think that the code is stuck. I don't know=20
why that would happen on the tx thread though, or why it would result in=20
an RCU stall, seeing as only a single access is made under an RCU lock=20
in this function...
