Return-Path: <SRS0=ZUZz=4Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4FFC10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Mar 2020 10:28:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465752072A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Mar 2020 10:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="uKDyfrft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465752072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87222427;
	Sun, 8 Mar 2020 10:23:22 +0000 (UTC)
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbfaa2d0
 for <wireguard@lists.zx2c4.com>; Sun, 8 Mar 2020 02:32:06 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id F1F3845520;
 Sat,  7 Mar 2020 21:37:05 -0500 (EST) (envelope-from bhyde@pobox.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-type:content-transfer-encoding; s=sasl; bh=E4gDgW2kolPO
 gAmog339oehy33A=; b=uKDyfrftT2r6oOiaaGvtZ+eu9nP/TQi6bAr1BCr0IDgk
 i5/jZiqTbICzYAnAAjLhvzsq2xcxmmfrRg4j0wMdfFBeenOSlSRtW41TnDMnVOjM
 jkUrg19wMcVI4OajlmQg/7DTcVX0Hsre/xgdv8k2LuKMzN1vywSZ6qnhVGfl5Eo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-type:content-transfer-encoding; q=dns; s=sasl; b=rFq56a
 p/Fa6xiKUtpLusWqI5bRmCgF9rk4iyMKSCjlSJzAsrCixb9MwJZyGxq0eAVqyf3k
 VHlr0LZR8n0/TZizYFdYKmsHBfBoXPqbqAoxBfC6C6zSe0iUo6CwWcLhMauIz2Dz
 JjlFeQQwm33EUZ/RNzqXmmG4r4z+URSgfIBfo=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E6BB94551F;
 Sat,  7 Mar 2020 21:37:05 -0500 (EST) (envelope-from bhyde@pobox.com)
Received: from [172.22.22.101] (unknown [209.6.122.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 4DCF44551E;
 Sat,  7 Mar 2020 21:37:05 -0500 (EST) (envelope-from bhyde@pobox.com)
From: "Ben Hyde" <bhyde@pobox.com>
To: tormen@mail.ch
Subject: Re: WireGuard for macOS
Date: Sat, 07 Mar 2020 21:37:03 -0500
X-Mailer: MailMate (1.13.1r5671)
Message-ID: <A159E572-2F0D-4A2F-96DE-FAC239C01DCE@pobox.com>
In-Reply-To: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
References: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="=_MailMate_A778E8A6-38E9-4D90-BD51-F1FB1E7473CF_="
X-Pobox-Relay-ID: B2EB8F22-60E5-11EA-B015-D1361DBA3BAF-31573486!pb-smtp2.pobox.com
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 08 Mar 2020 11:23:20 +0100
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--=_MailMate_A778E8A6-38E9-4D90-BD51-F1FB1E7473CF_=
Content-Type: text/plain; charset="UTF-8"; format=flowed; markup=markdown
Content-Transfer-Encoding: quoted-printable

Tormen -

Try: sudo scutil --nc list

If you see the wireguard setup in the list then you can then
read the man page for scutil to see assorted =E2=80=94nc subcommands;
including ones to start and stop it.

I do not understand why some of my wireguard tunnels do not
appear in scutil=E2=80=99s list.  But yeah, it=E2=80=99s all magic!

  - ben

On 7 Mar 2020, at 12:03, tormen@mail.ch wrote:

> Dear Wireguard Team,
>
> First off, thanks a lot for the client for macOS !!
>
> Is there a possibility to issue a "Connect" / "Disconnect" command=20
> from the command line
> instead of using the buttons in the GUI ?
>
> I would love to use both (GUI + CLI): No automatic connect in the GUI,=20
> but rather automatically connect / reconnect via script (so via=20
> command-line interface, CLI).
> And I don't like the idea of not using the GUI and switching to the=20
> cli version as then I don't have the icon.
>
> Thanks a lot in advance for any hint or feedback!
>
> Tormen

--=_MailMate_A778E8A6-38E9-4D90-BD51-F1FB1E7473CF_=
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/xhtml; charset=3Dutf-8"=
>
</head>
<body>
<div style=3D"font-family:sans-serif"><div style=3D"white-space:normal">
<p dir=3D"auto">Tormen -</p>

<p dir=3D"auto">Try: sudo scutil --nc list</p>

<p dir=3D"auto">If you see the wireguard setup in the list then you can t=
hen<br>
read the man page for scutil to see assorted =E2=80=94nc subcommands;<br>=

including ones to start and stop it.</p>

<p dir=3D"auto">I do not understand why some of my wireguard tunnels do n=
ot<br>
appear in scutil=E2=80=99s list.  But yeah, it=E2=80=99s all magic!</p>

<ul>
<li>ben</li>
</ul>

<p dir=3D"auto">On 7 Mar 2020, at 12:03, <a href=3D"mailto:tormen@mail.ch=
" style=3D"color:#3983C4">tormen@mail.ch</a> wrote:</p>

<blockquote style=3D"border-left:2px solid #777; color:#777; margin:0 0 5=
px; padding-left:5px">
<p dir=3D"auto">Dear Wireguard Team,</p>

<p dir=3D"auto">First off, thanks a lot for the client for macOS !!</p>

<p dir=3D"auto">Is there a possibility to issue a "Connect" / "Disconnect=
" command from the command line<br>
instead of using the buttons in the GUI ?</p>

<p dir=3D"auto">I would love to use both (GUI + CLI): No automatic connec=
t in the GUI, but rather automatically connect / reconnect via script (so=
 via command-line interface, CLI).<br>
And I don't like the idea of not using the GUI and switching to the cli v=
ersion as then I don't have the icon.</p>

<p dir=3D"auto">Thanks a lot in advance for any hint or feedback!</p>

<p dir=3D"auto">Tormen</p>
</blockquote>
</div>
</div>
</body>
</html>

--=_MailMate_A778E8A6-38E9-4D90-BD51-F1FB1E7473CF_=--
