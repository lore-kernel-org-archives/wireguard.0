Return-Path: <SRS0=PPAX=MS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65220C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 10:21:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90DC20875
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 10:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="g/Aj/2jW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90DC20875
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65ef4f55;
	Sat, 6 Oct 2018 10:20:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15832a6c
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 10:20:36 +0000 (UTC)
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e497224
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 10:20:36 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 3290436D7C
 for <wireguard@lists.zx2c4.com>; Sat,  6 Oct 2018 06:21:07 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type; s=sasl; bh=/vbIYuq+ZqLbZnVbVlA14n31kLc=; b=g/Aj/2
 jWz0fPgYgekijH27Nhay9q+xsfL97EXEvPA+AOdv6CWnkgx45WeS38WdsH/oZr6N
 Eedpbzwbh9wH374nsKxlf8XAeXU+zeC1AJP2jC7gAemBwTcv6gV7YZsHLDl4jUK9
 AgRWzhlaOev+0mG5PptQqfuyVij38PUZ8Oor8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type; q=dns; s=sasl; b=nQX3zvS2iY51338gIiZS6qeL3ZLf4O6N
 aJUZeLMnoZn8Cl8Po6MYtCvwekqW5WDmBzPTAzOx/6Ckf0gjtYrpFkJa2XDgB+7k
 1gODuFrmsFpJAe9UrlJi3x1mGo+afulaQtqufpaGIA3cX3fr/djihjxW5hekkohS
 yi/Ef2AvJ68=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 2BD7D36D7A
 for <wireguard@lists.zx2c4.com>; Sat,  6 Oct 2018 06:21:07 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Received: from MacBook-Pro-3.local (unknown [84.92.42.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 63ACC36D79
 for <wireguard@lists.zx2c4.com>; Sat,  6 Oct 2018 06:21:04 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Subject: Re: Sending just ssh traffic via wg
To: wireguard@lists.zx2c4.com
References: <mailman.1.1538820001.22807.wireguard@lists.zx2c4.com>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <3a187f3e-faa8-fcb2-4d14-a07fe9781809@pobox.com>
Date: Sat, 6 Oct 2018 11:21:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.1.1538820001.22807.wireguard@lists.zx2c4.com>
Content-Language: en-US
X-Pobox-Relay-ID: 87F9EAD4-C951-11E8-BB83-CC883AD79A78-28021239!pb-smtp21.pobox.com
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
Content-Type: multipart/mixed; boundary="===============4102986272608692038=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============4102986272608692038==
Content-Type: multipart/alternative;
 boundary="------------22C24018A2899B6057CA9F91"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------22C24018A2899B6057CA9F91
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06/10/2018 11:00, wireguard-request@lists.zx2c4.com wrote:
>> This may be a stupid question, but why do you need OpenVPN any more, i=
f
>> you have Wireguard?
> Because it's already there?:)
>
> Furthermore, some members of our IT team use macs (gasp!) and for them
> it would be much easier to continue to use OpenVPN than to set up
> wireguard-go.
>
I use wireguard on a Mac and it was as simple as "brew install=20
wireguard-tools"; create config; "sudo wg-quick up wg0".

My even more stupid question is "why use wireguard if the only thing=20
it's carrying is ssh?" - but I guess it's a convenient way to tunnel to=20
a network which doesn't have public-routed addresses.

(Aside: I wish ssh had a feature like SNI, so that you could build an=20
ssh proxy that forwards incoming connections to the right host.=C2=A0 I h=
ave=20
done this before using an inbound SOCKS proxy, but it's messy to use)


--------------22C24018A2899B6057CA9F91
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">On 06/10/2018 11:00,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:wireguard-requ=
est@lists.zx2c4.com">wireguard-request@lists.zx2c4.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:mailman.1.1538820001.22807.wireguard@lists.zx2c4.com">
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <pre wrap=3D"">This may be a stupid question, but why do you need=
 OpenVPN any more, if
you have Wireguard?
</pre>
      </blockquote>
      <pre wrap=3D"">Because it's already there? <span class=3D"moz-smile=
y-s1" title=3D":)"><span>:)</span></span>

Furthermore, some members of our IT team use macs (gasp!) and for them=20
it would be much easier to continue to use OpenVPN than to set up=20
wireguard-go.

</pre>
    </blockquote>
    <p>I use wireguard on a Mac and it was as simple as "brew install
      wireguard-tools"; create config; "sudo wg-quick up wg0".<br>
    </p>
    <p>My even more stupid question is "why use wireguard if the only
      thing it's carrying is ssh?" - but I guess it's a convenient way
      to tunnel to a network which doesn't have public-routed addresses.<=
br>
    </p>
    <p>(Aside: I wish ssh had a feature like SNI, so that you could
      build an ssh proxy that forwards incoming connections to the right
      host.=C2=A0 I have done this before using an inbound SOCKS proxy, b=
ut
      it's messy to use)<br>
    </p>
  </body>
</html>

--------------22C24018A2899B6057CA9F91--

--===============4102986272608692038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4102986272608692038==--
