Return-Path: <SRS0=PPAX=MS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAE6C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 10:28:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B65CA2087D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 10:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="RSGa+Kgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B65CA2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40a4ece0;
	Sat, 6 Oct 2018 10:28:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c128583
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 10:28:24 +0000 (UTC)
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9854c8a6
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 10:28:24 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 483AE36DD4;
 Sat,  6 Oct 2018 06:28:55 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=subject:to:cc
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type; s=sasl; bh=FBjKV/DxwjfYj/xdi5WfjZlmE0Q=; b=RSGa+K
 gdKHTo5gu6BzoP6VvdOgzl+2UbxWENiRLMzOdzGlHaw2ME8r5M0a1rE3Ab/xY3D8
 WSLTTzrqOaDl/aj/n2RP8vixNQyzCfiLMOiozr//nMVlJOdqjlBknWAiaclJw0BJ
 OxHbwGFoJpFKkO4lTOweIFqtwmjewodw+Qzas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=subject:to:cc
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type; q=dns; s=sasl; b=b+6/sDFgOZSd+sY9ISvHwH5esm7JdoEK
 Nzn/FxE2JAi5jn/35xQJja69iD2y13FLfbeMwyzan3mvPcoWccmiwq/eWfJOHuG4
 Yfhfbe+wLdIm+N+XOq8BdOP+d+0VewVVncXZCg02hin8/4RwWJJZGu2EQCn0N9P0
 QgXwr2gSdnM=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 413BD36DD3;
 Sat,  6 Oct 2018 06:28:55 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Received: from MacBook-Pro-3.local (unknown [84.92.42.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 6DEED36DD2;
 Sat,  6 Oct 2018 06:28:52 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Subject: Re: Sending just ssh traffic via wg
To: Roman Mamedov <rm@romanrm.net>
References: <mailman.1.1538820001.22807.wireguard@lists.zx2c4.com>
 <3a187f3e-faa8-fcb2-4d14-a07fe9781809@pobox.com>
 <20181006152715.2f8e83b4@natsu>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <16654517-3717-065a-f48e-9c6470fc6999@pobox.com>
Date: Sat, 6 Oct 2018 11:28:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181006152715.2f8e83b4@natsu>
Content-Language: en-US
X-Pobox-Relay-ID: 9F098DAA-C952-11E8-8538-CC883AD79A78-28021239!pb-smtp21.pobox.com
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============9101386464097432902=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============9101386464097432902==
Content-Type: multipart/alternative;
 boundary="------------5602758757412DBF9297FD08"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5602758757412DBF9297FD08
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06/10/2018 11:27, Roman Mamedov wrote:
>> (Aside: I wish ssh had a feature like SNI, so that you could build an
>> ssh proxy that forwards incoming connections to the right host.=C2=A0 =
I have
>> done this before using an inbound SOCKS proxy, but it's messy to use)
> What insane things people invent only not to use IPv6:)

Quite the opposite: I want it so that I can reach my IPv6-addressable=20
devices when I'm on an IPv4-only network.=C2=A0 Which means, almost=20
everywhere :-)


--------------5602758757412DBF9297FD08
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">On 06/10/2018 11:27, Roman Mamedov
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20181006152715.2f8e83b4@natsu">
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <pre wrap=3D"">(Aside: I wish ssh had a feature like SNI, so that=
 you could build an=20
ssh proxy that forwards incoming connections to the right host.=C2=A0 I h=
ave=20
done this before using an inbound SOCKS proxy, but it's messy to use)
</pre>
      </blockquote>
      <pre wrap=3D"">What insane things people invent only not to use IPv=
6 <span class=3D"moz-smiley-s1" title=3D":)"><span>:)</span></span></pre>
    </blockquote>
    <p>Quite the opposite: I want it so that I can reach my
      IPv6-addressable devices when I'm on an IPv4-only network.=C2=A0 Wh=
ich
      means, almost everywhere :-)</p>
  </body>
</html>

--------------5602758757412DBF9297FD08--

--===============9101386464097432902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9101386464097432902==--
