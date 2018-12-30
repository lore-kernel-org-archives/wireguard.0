Return-Path: <SRS0=y9CJ=PH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C63C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Dec 2018 20:09:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A583620855
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Dec 2018 20:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="WzgnCdLA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CoUv6s1u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A583620855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ccc3ddb;
	Sun, 30 Dec 2018 20:07:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6398df9
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Dec 2018 20:07:49 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 828ef7ea
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Dec 2018 20:07:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C0F721A7B;
 Sun, 30 Dec 2018 15:09:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 30 Dec 2018 15:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=D
 OTmF0AiR197phRRt1i4BDa2tOhU3Wu1xhy3Qb5WQdk=; b=WzgnCdLAzTtueSVJn
 8u4vGY6tLfYbzRnDd7dHmcElEzPpGHaPHwG+XBJrjX5VK+rxXtx2oRDp66v4E2p2
 G/uDB1JIeVBU0voWCzfGP+5LdKGFN0FhGvF3igW8+0b/cz1/Xz0DxrEOma8lij1j
 iFJ6/pfwXb0aSNbZH5TjcJYrc07phEitrg153obVTgqS5pgS9deKMc1OGvzBbFDz
 8NXk3HQnZkYmSBxY65MOwXhcQBkfAt3bzPiw1BR0aqbehdmFM+d/ULZmdVq6TTSO
 hSYw884kOnUCSxyWyJlzXv1pud4LERMlGx3qVuiSNYOf/FW2ymbaanXJqTB/ogYt
 L/xgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=DOTmF0AiR197phRRt1i4BDa2tOhU3Wu1xhy3Qb5WQ
 dk=; b=CoUv6s1uhE4+Y4TwsHcgdb9QnOH5Qyx1O4HDnSPb1rYT0OUh/Ka1CkKFa
 Z4TyoRZaJ8rY1WmgTfgfjVzR/ffFCqU6iDKdxxClVua4wBtE9Gzo81FsutQw06w9
 UbSQ8SI+RKir7318YKir9EEJbbGAv7UyQiPsbdJsL6thz3OxhoiDpFR7H0b+3MHO
 ykYUVs1lIjL3fQqRiRVrq0g5AHnTm5FLhpvAfXE1uYp+2qOieRzvyy88Tm48quRB
 /cVsNfsSB1ES5ln5zFHFiWmhg5wVSBdtkclbz3bWb8qFze7WFOWXF2IIia0s7fea
 JSaubCtBuq78sAksFfS8IBcj74j8w==
X-ME-Sender: <xms:DiYpXBendOMf5HdWCV5nAVKJ2pPo2mOoZQ1fCUorPdSfQWZsQgC44Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddtgddufeegucdltddurdegtdekrddttd
 dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesth
 ejredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
 sehshhholhhlrghnugdrohhrgheqnecuffhomhgrihhnpehgmhhsrdhithenucfkpheple
 elrdduleekrdduleelrddugeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgv
 lhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:DiYpXGLQkJuQmRxJ-ctSNwOSB_sExM3Bsem8OWWBKu0vIu9i7fcKxw>
 <xmx:DiYpXA9x-fkypHymkxigJSdCxqXByWG8dnjHA8PgjWmi3U3hkaSroA>
 <xmx:DiYpXJemDwg6_o-3JM1ssbXgZDylWvZAPZBagDGYyocMKqQcj5ltnw>
 <xmx:DyYpXPVp8nZcM_RW7IjXzliL5HlbYEJtKeZSSwZ7l4Qt_LTR909e_w>
Received: from [192.168.17.162] (unknown [99.198.199.144])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8D63100BA;
 Sun, 30 Dec 2018 15:09:49 -0500 (EST)
Subject: Re: [Android app] Can't connect to a chromecast when wireguard is
 running
To: Christophe-Marie Duquesne <chmd@chmd.fr>,
 wireguard <wireguard@lists.zx2c4.com>
References: <CAHLp1YkibRSvohY9FJ5G+FXaEw4tFU52rLsbWLSP8oiL0K=rhQ@mail.gmail.com>
 <CAHLp1YmoZV-T+d_U_GDhSpgbK1099x+xVEUX=T24q5u=SKCnJA@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <084d8dd5-22d2-9635-514f-e2710190ddd6@sholland.org>
Date: Sun, 30 Dec 2018 14:09:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHLp1YmoZV-T+d_U_GDhSpgbK1099x+xVEUX=T24q5u=SKCnJA@mail.gmail.com>
Content-Language: en-US
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

Hi,

On 12/30/18 13:10, Christophe-Marie Duquesne wrote:
> Thinking about my former setup with Openvpn, I realized it had a setting 
> "bypass VPN for local networks" (under "routing"). Is there such a thing in 
> the Wireguard app? (In the peer config, there is a checkbox "Exclude private 
> IPs". In doubt, I tried to enable it, but then the wireguard interface 
> stopped working with the message "Error bringing up tunnel: Bad address")
> 
> Generally, the app which I believe would solve my chromecast problem is 
> probably "Google play services" (com.google.android.gms). It is
> unfortunately not part of the list of applications one can exclude from the
> UI. Is there a way to do one of these two things? - Implement a feature
> similar to "bypass VPN for local networks"

That's the idea with the "Exclude private IPs" checkbox. Anything in the
RFC1918 range will not use the tunnel. Could you export a log (there's an option
in the app settings) with it failing, and send it to me (privately if you want)?

> - Make it possible to exclude an application by string input (directly typing
> "com.google.android.gms" in some text area)

You can do that today by exporting the configuration, adding a line to the
[Interface] section, and re-importing:

    ExcludedApplications=com.google.android.gms

The UI currently shows all apps that have a launcher icon. Maybe we need to
change that filter? Can you check if there's a "Google Settings" or similar
entry in the list? I believe that's the name of the launcher entry point for
Google Play Services.

> Thanks, Christophe-Marie

Regards,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
