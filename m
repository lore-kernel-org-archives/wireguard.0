Return-Path: <SRS0=r/1I=Z2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD48C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Dec 2019 00:35:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9091C20674
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Dec 2019 00:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbTxMG1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9091C20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44699604;
	Wed, 4 Dec 2019 00:35:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c582b790
 for <wireguard@lists.zx2c4.com>; Wed, 4 Dec 2019 00:35:32 +0000 (UTC)
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 448dfc94
 for <wireguard@lists.zx2c4.com>; Wed, 4 Dec 2019 00:35:32 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id w10so2106744uar.12
 for <wireguard@lists.zx2c4.com>; Tue, 03 Dec 2019 16:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z11gXj6IT43ObVEI6z0H6iXjvZyOkGd05q+x4IEtVpA=;
 b=DbTxMG1AovuR3M7VL7duVW51ttS+NOoPFL6rQWhWt7dyIeaYfqCNURKDRt9IZiXWS+
 LT0nHYQRIejr/SJ1NldYM7rnjLxdkKSOn4CIJvlsuPzObit9IDDnUUveKkTZ/H6zj8+f
 Otfrqc1HvvMUGUdvvq9IIzA9WievMY06t+vpech+RxuDcPwvmEny3IwtEEtCpUuEwXL4
 Xkta3jh7ORJnu4gPZ7JYXQ7xbWaVhoG+hlDDHAPag4Z6IaowlDmPhurK8fvrAcuYdZF7
 d23lHXypOaEeZwvN4XFJXfWAYTabX8DCDFup874T7HDtvOBbTCYnjKRMkrFEyoQmJGQJ
 Xn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z11gXj6IT43ObVEI6z0H6iXjvZyOkGd05q+x4IEtVpA=;
 b=FqIM0rHB6fM+VSiDjnO/KD22UK9ydmLpPVi6gI9UzuTrl+Z4dhq1PPYWK+AerxkvLB
 Ijk0CYNHmEqdL15BgoYn18cvmlaRdnhR06my8Mn0OCm+fFkE/MnsJ5GTlACz2I+qjrDA
 zb+FCh0mOhE11oTDKyLri68y+BMTINyeaq3Xe4CePj8BxBJKTTyZ8auKQViUyt/6rvG/
 pjp6R1sjIiWBJDzysIyOfXprRxMLxM/ExYEhMphUrDIpDrWAJIa3f5zgOmkG62Ik58/r
 2G8hcGIFi8JCy03dyqeV3le6rf+DjJGk88xL1ik1gfMeFmm0in7WJCRthoB9RFh2BNj1
 1+lw==
X-Gm-Message-State: APjAAAXkgfeXqcFcku7mqH7ueTlAkgXfFlDZkgEe8QRpkk49GibRFfgX
 Esx+zyLL2PwraBkICsQmu5OnV0kHLW0W5mI1dbA=
X-Google-Smtp-Source: APXvYqwqR3r38dTdnsEtcXmLuVkWwe5X5T1al0D9NmybFvGVSBriswXJbfruSuy1U40MB3Jn6k01hUyjqqm6dDbVt7E=
X-Received: by 2002:ab0:3413:: with SMTP id z19mr809382uap.15.1575419730420;
 Tue, 03 Dec 2019 16:35:30 -0800 (PST)
MIME-Version: 1.0
References: <CABPTpJBGQcze6b3_tJij8Ysp8zwb_4fyQAEv_fy4Bx9YpVcpRw@mail.gmail.com>
 <CAHmME9rjiN_q7yhFtaUybaX+x60qeVJ8+oFTdWtr65yb6CMzqQ@mail.gmail.com>
 <13b61b9c-0fbd-2588-99b0-b377ce8a4c4f@netravnen.de>
In-Reply-To: <13b61b9c-0fbd-2588-99b0-b377ce8a4c4f@netravnen.de>
From: Reuben Martin <reuben.m.work@gmail.com>
Date: Tue, 3 Dec 2019 18:35:18 -0600
Message-ID: <CALJ2VGa9Jj8O6CC76YN7XzsTAD=b_ub5_WOF=uNFhca-0QyogQ@mail.gmail.com>
Subject: Re: [wireguard] Wireguard for Windows - local administrator necessary?
To: chriztoffer@netravnen.de
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============0265760916590261784=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0265760916590261784==
Content-Type: multipart/alternative; boundary="000000000000676be80598d5fde1"

--000000000000676be80598d5fde1
Content-Type: text/plain; charset="UTF-8"

You can use fwknop to automate this type of sysadmin level changes in a
secure manner.

-Reuben

On Tue, Dec 3, 2019, 3:09 PM CHRIZTOFFER HANSEN <chriztoffer@netravnen.de>
wrote:

>
> Jason A. Donenfeld wrote on 27/11/2019 13:29:
> > On Wed, Nov 27, 2019 at 10:07 AM Chris Bennett <chris@ceegeebee.com>
> wrote:
> >> However I've found the logged in user needs local Administrator access
> to activate and de-activate a tunnel.  Is there any way around this?  Is it
> in the roadmap to remove this requirement?
> >
> > No intention of reducing the security of the system, no. WireGuard
> > requires administrator access because redirecting an entire machine's
> > network traffic is certainly an administrator's task.
>
> What if you this functionality is coded as opt-in, for e.g. a org/corp
> sysadmin to enable for the users, and *not* opt-out?
>
> The the default knob will still be secure, and the sysadmin has the
> conscious possibility to put power in the hand of the users. And it will
>   be the sysadm's choice. Not the team behind pushing the development of
> WireGuard forward, taking a choice on behalf of the consumer/user base.
>
> Chriztoffer
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000676be80598d5fde1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You can use fwknop to automate this type of sysadmin leve=
l changes in a secure manner.=C2=A0<div dir=3D"auto"><br></div><div dir=3D"=
auto">-Reuben</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Dec 3, 2019, 3:09 PM CHRIZTOFFER HANSEN &lt;<a h=
ref=3D"mailto:chriztoffer@netravnen.de">chriztoffer@netravnen.de</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
Jason A. Donenfeld wrote on 27/11/2019 13:29:<br>
&gt; On Wed, Nov 27, 2019 at 10:07 AM Chris Bennett &lt;<a href=3D"mailto:c=
hris@ceegeebee.com" target=3D"_blank" rel=3D"noreferrer">chris@ceegeebee.co=
m</a>&gt; wrote:<br>
&gt;&gt; However I&#39;ve found the logged in user needs local Administrato=
r access to activate and de-activate a tunnel.=C2=A0 Is there any way aroun=
d this?=C2=A0 Is it in the roadmap to remove this requirement?<br>
&gt; <br>
&gt; No intention of reducing the security of the system, no. WireGuard<br>
&gt; requires administrator access because redirecting an entire machine&#3=
9;s<br>
&gt; network traffic is certainly an administrator&#39;s task.<br>
<br>
What if you this functionality is coded as opt-in, for e.g. a org/corp <br>
sysadmin to enable for the users, and *not* opt-out?<br>
<br>
The the default knob will still be secure, and the sysadmin has the <br>
conscious possibility to put power in the hand of the users. And it will <b=
r>
=C2=A0 be the sysadm&#39;s choice. Not the team behind pushing the developm=
ent of <br>
WireGuard forward, taking a choice on behalf of the consumer/user base.<br>
<br>
Chriztoffer<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000676be80598d5fde1--

--===============0265760916590261784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0265760916590261784==--
