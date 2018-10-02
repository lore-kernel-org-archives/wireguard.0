Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE614C43143
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 12:45:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2FD2064A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 12:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Ch3yNHy4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF2FD2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3ae910f;
	Tue, 2 Oct 2018 12:44:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b395c3b
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 12:44:34 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0b0e80b
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 12:44:34 +0000 (UTC)
Date: Tue, 02 Oct 2018 12:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1538484275;
 bh=/a0duIKR6Y9Ct4/X8cbZaOe3H9xbn56UKI142gn5n0o=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=Ch3yNHy4CDmhpuGMpm5IdurdVScb4tK6ME0zgGxV9ZOoi7p0Ia3j7O9qNDiyhWVmq
 fwn3/LSoP0B/3g1NflvZIcRRSBBLYLRX8PlFBPDUucuErbxyQKJBJDsti7O8RqEa3/
 6JAXTFhrUYtstrZFZOtZKNsXtiDZp7AiGzWr3Lac=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Lane Russell <lanerussell@protonmail.com>
Subject: Re: Connection issues with Google Fi
Message-ID: <zzEid2E_FfHAIAEL93iSR4Y8Os52Ns4JOr9GRa8oB89QAkQPX4vwz6MPMiXlGhYSd5AWDr3INFufkti3IEbDDhc5McK7Y3Yo8KaF_l_0cS8=@protonmail.com>
In-Reply-To: <CAHmME9qnSv7QwYwvPt5EGKabxmnSD-H4bVX6Zjd4nT_37tw1YA@mail.gmail.com>
References: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
 <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
 <EHYEPfkFpkfKvezFkP0dpmtlpyl6SuHLqMvOWl8PMZhUJZxGjQTmfbL8YqhxxC4NsvFm7p4N6OFTmfURdPerP5quN0wgmhTSDSBgac-GvS0=@protonmail.com>
 <qKu5swioFkO6-GRUyzeclQ3H7fOed-Uf0Xd4QZRw0pwywVTaZZop9zTIGQ8EBAGGXhSJeTgu3_XSLYgFNaokCvVDSNdkvMr6Y6QiDHme-io=@protonmail.com>
 <CAHmME9pMGSL+w21n6FFTY+SHse=vVhYroBxaOE+q4VNCsJ7rRw@mail.gmail.com>
 <yZN05e4mYXQs69yJc0eznZPyvvnuUoIekRECdcz0CfbIgD2bzTaiSitq02pVphUqV5WYvBk4vn413gDeZq-70EjVYo5VfMhtCCWsPpZp8sI=@protonmail.com>
 <CAHmME9qnSv7QwYwvPt5EGKabxmnSD-H4bVX6Zjd4nT_37tw1YA@mail.gmail.com>
Feedback-ID: jhVgiX6_q-2hbdKQuEXcQXOKG_NeIdN6tYuPxgmVVFfYrZt1KrXoO6kRAhv_E12tTMk04CLY8AR2Ll0xF8yi-Q==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Lane Russell <lanerussell@protonmail.com>
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

Installed the new release and tried roaming from Fi service to WiFi, all appears to be working as expected. Thanks for following up!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
