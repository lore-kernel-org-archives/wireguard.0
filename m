Return-Path: <SRS0=XtlP=3O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E3EC35241
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 06:52:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C662071A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 06:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="deJkzrvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C662071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=honson.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6393e5d;
	Sat, 25 Jan 2020 06:52:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9d31a83
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 06:51:57 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6736bab9
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 06:51:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C36C221947
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jan 2020 01:51:56 -0500 (EST)
Received: from imap21 ([10.202.2.71])
 by compute3.internal (MEProxy); Sat, 25 Jan 2020 01:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=he3/Pz
 ndQnw58mEmHBXb7J+RqNCEOqsUp9pdLAnHKts=; b=deJkzrvd8M/6iYGV+YBCCf
 owj5CSkmoI5GYWcEkvxJtmws4HZFx7tOOEM9gmkKjxzZrzfHgUjj7Im0Yg8e3pxR
 RrVfdN276Q34pGcV7UiAyi6hLQHtGTCuRNAcxe6DAz5HlHSyoyrOkMB0w9fd/fis
 B/xpWBKXxtPVkgp0McTQAAEwkSqUYdFUz6UEkGuHsRULRtEBpOZcQOmbWKxYus9q
 UOLFjo+TbpXQhuMatsa9LupASvkQKNnd/Sso747YpuONeJI8hrdwrz6WLLRys2C7
 FyQCLFBn/LA/lB+dP2hTaV3zZXFI0lfzyvajGdhGgS2R+W/+H/7DXbi7yB5IbzQw
 ==
X-ME-Sender: <xms:jOUrXstNIS4D0ivzYWgfX4siqxMMZlU0frIviHOwQPcC90g9VHg94g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdeigdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrgdtre
 erreertdenucfhrhhomhepfdfuthgvvhgvnhcujfhonhhsohhnfdcuoehsthgvvhgvnhes
 hhhonhhsohhnrdhiugdrrghuqeenucffohhmrghinhepiiigvdgtgedrtghomhdpghhith
 hhuhgsrdgtohhmpdhophgvnhdqmhgvshhhrdhorhhgnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepshhtvghvvghnsehhohhnshhonhdrihgurd
 gruh
X-ME-Proxy: <xmx:jOUrXiMdX-6Nsmb1aJgcXvdte6mOb_bjTYvhaW7zl70fz91l6z87OA>
 <xmx:jOUrXmf5j3OcMwWWAdTEhpjSpG6uvAOuuO-yq8nONZFdq_7sqBZMiA>
 <xmx:jOUrXhlSbi1_3HaoVSvjXHms689sBCAEs18gmyEsc-D_3wy7eLc4cw>
 <xmx:jOUrXq6AugXsvio6-DAq_kx1Ml-zuVEu1geV_xxi5KflmCG-JmQmPw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 50625660065; Sat, 25 Jan 2020 01:51:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-777-gdb93371-fmstable-20200123v1
Mime-Version: 1.0
Message-Id: <06a605c4-8d84-487a-899e-fe7ed899189c@www.fastmail.com>
In-Reply-To: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
References: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
Date: Sat, 25 Jan 2020 17:51:45 +1100
From: "Steven Honson" <steven@honson.id.au>
To: wireguard@lists.zx2c4.com
Subject: Re: wireguard-hosts file
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
Content-Type: multipart/mixed; boundary="===============6969047234315428791=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6969047234315428791==
Content-Type: multipart/alternative;
 boundary=4943c4de09e64185a206d81e986791c7

--4943c4de09e64185a206d81e986791c7
Content-Type: text/plain

Hi!

There was some work underway a while back for something along these lines in https://git.zx2c4.com/wireguard-monolithic-historical/commit/?h=lr/peer-names&id=f50ef1676fe5861c9071910d2caf64593a28d837, <https://git.zx2c4.com/wireguard-monolithic-historical/log/?h=lr/peer-names> but unfortunately that work stalled out.

There are a few workarounds/alternatives out there such as https://github.com/warner/wireguard-vanity-address, which will help you generate keypairs with a short defined string in the public key, but this isn't likely to be workable for a large number of peers.

Cheers,
Steven

On Sat, 25 Jan 2020, at 3:01 AM, jens wrote:
> i really would love to have a feature like wireguard-hosts file.
> whereas wg command would print given "name" instead of key - so the
> output would be more meaningfull
> We have some wireguard running in server like infrastructure, where one
> server serves dozens of "clients"
> 
> so instead of
> peer: l9FxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaU=
> we would have something alike
> peer: superhero downtown
> 
> some of you may be familar with batman-adv layer2 routing protocol,
> there they also have a batctl which is working pretty similar to wg tool.
> there you can add a bat-hosts file which is doing the job, which totaly
> works likes any hosts file
> a normal hosts file maps ip to name,
> a bat-hosts file maps mac addresses to name,
> a wg-hosts file would map keys to name.
> 
> i found the sources for bat-hosts ( .c .h .sample ) here
> https://downloads.open-mesh.org/batman/releases/batman-adv-2019.5/batctl-2019.5.tar.gz
> 
> is this something maybe usefull to other also?
> is there a chance to have this implemented by default?
> 
> thx for answers.
> fuzzle
> 
> -- 
> make the world nicer, please use PGP encryption
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
> 
> *Attachments:*
>  * 0x507EB93F6F6DEE01.asc

--4943c4de09e64185a206d81e986791c7
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Hi!<br></div><d=
iv><br></div><div>There was some work underway a while back for somethin=
g along these lines in <a href=3D"https://git.zx2c4.com/wireguard-monoli=
thic-historical/commit/?h=3Dlr/peer-names&amp;id=3Df50ef1676fe5861c90719=
10d2caf64593a28d837">https://git.zx2c4.com/wireguard-monolithic-historic=
al/commit/?h=3Dlr/peer-names&amp;id=3Df50ef1676fe5861c9071910d2caf64593a=
28d837</a><a href=3D"https://git.zx2c4.com/wireguard-monolithic-historic=
al/log/?h=3Dlr/peer-names">,</a> but unfortunately that work stalled out=
.</div><div><br></div><div>There are a few workarounds/alternatives out =
there such as <a href=3D"https://github.com/warner/wireguard-vanity-addr=
ess">https://github.com/warner/wireguard-vanity-address,</a> which will =
help you generate keypairs with a short defined string in the public key=
, but this isn't likely to be workable for a large number of peers.<br><=
/div><div><br></div><div>Cheers,<br></div><div>Steven<br></div><div><br>=
</div><div>On Sat, 25 Jan 2020, at 3:01 AM, jens wrote:<br></div><blockq=
uote type=3D"cite" id=3D"qt"><div>i really would love to have a feature =
like wireguard-hosts file.<br></div><div>whereas wg command would print =
given "name" instead of key - so the<br></div><div>output would be more =
meaningfull<br></div><div>We have some wireguard running in server like =
infrastructure, where one<br></div><div>server serves dozens of "clients=
"<br></div><div><br></div><div>so instead of<br></div><div>peer: l9Fxaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaU=3D<br></div><div>we would have someth=
ing alike<br></div><div>peer: superhero downtown<br></div><div><br></div=
><div>some of you may be familar with batman-adv layer2 routing protocol=
,<br></div><div>there they also have a batctl which is working pretty si=
milar to wg tool.<br></div><div>there you can add a bat-hosts file which=
 is doing the job, which totaly<br></div><div>works likes any hosts file=
<br></div><div>a normal hosts file maps ip to name,<br></div><div>a bat-=
hosts file maps mac addresses to name,<br></div><div>a wg-hosts file wou=
ld map keys to name.<br></div><div><br></div><div>i found the sources fo=
r bat-hosts ( .c .h .sample ) here<br></div><div>https://downloads.open-=
mesh.org/batman/releases/batman-adv-2019.5/batctl-2019.5.tar.gz<br></div=
><div><br></div><div>is this something maybe usefull to other also?<br><=
/div><div>is there a chance to have this implemented by default?<br></di=
v><div><br></div><div>thx for answers.<br></div><div>fuzzle<br></div><di=
v><br></div><div>--&nbsp;<br></div><div>make the world nicer, please use=
 PGP encryption<br></div><div><br></div><div>___________________________=
____________________<br></div><div>WireGuard mailing list<br></div><div>=
WireGuard@lists.zx2c4.com<br></div><div>https://lists.zx2c4.com/mailman/=
listinfo/wireguard<br></div><div><br></div><div><br></div><div><b>Attach=
ments:</b><br></div><ul><li>0x507EB93F6F6DEE01.asc<br></li></ul></blockq=
uote><div><br></div></body></html>
--4943c4de09e64185a206d81e986791c7--

--===============6969047234315428791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6969047234315428791==--
