Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D79C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:06:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D85C20674
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:06:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrjaTk6b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D85C20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f49489e3;
	Wed, 27 Nov 2019 09:05:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0228c9b0
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 09:30:25 +0000 (UTC)
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b13a4eae
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 09:30:24 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id k9so4292460oib.7
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2019 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OhI6asPXqrSCpmxsfQWHViXxU9K2+E+TAaAh9KmeitQ=;
 b=mrjaTk6bUXSk/Dw9rfNJPOQdLhufJgMy+UXzXchlQiF900UTion2jq45spxwLywS1J
 KlxUcEcHREmkRNXozwe5zVzA/65sgPfDmdW0ui1c90apiJgjrvxhtmB7Wq7eTkQdVXup
 syrrNnB1+O8EuWzbaXvr4WaJCZ87laNRFUUpnT36z9eluf5XXr+tpSkhKIj5cgp1xglg
 uHUT2+rCG77Mq3ytsgS3rP1XlQ98G7w8KyGMutXH7ttPTvw/AAlBdStIaPy3UQbS8K8N
 VO96liX9Kj0dFSZbnGOF2n1/VUuPRB06ZB6wKZ7WmynZgkMXl3Qg6VLVaWzuP6V2UL+2
 7kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OhI6asPXqrSCpmxsfQWHViXxU9K2+E+TAaAh9KmeitQ=;
 b=ijFYqdUgRBARXzHUgxuiUCbv+kmee6uaBQlPVswX+ATac9B6VWf9HrzwAz1MP/QYQX
 poCFhaSPztdY1BJ5rcGvD17B1zud8g32zQEdfIopdzXgD41OD4KwYlfJlK++MU0aqj+G
 Xuj4NfDjUysCM6k4QdApXHmy6BlpxR7nbQ8Ywb80CTEDRyOWNZro3BWrjL8r/L3wupwr
 1dgb+0Opf3a5G8+sxMBFjt3qIpq81bn5AY/L8AGHAYYYECYYrBdzKXtcGyypX++MZXl5
 Zwh1IAn/FkFfJe4nHVpCPOTUVUE3jamyF6en4Vs/rU67AWOJ3yfg4qoYrZXR/E0bPy1I
 kPTw==
X-Gm-Message-State: APjAAAW1lD16MUtVKZrvDXg/Islji65HuIFK3FXxbUPr2qN1YyxcowQV
 0FwrmHyGTaCLDeh900FpEbJWNxxgkcfLL9cPuJJwWg+6
X-Google-Smtp-Source: APXvYqwP7MWsy8hII49xTSJfAoJ9DtiKe7ljWem+6CP9ZdkuYDAZsNNxgi5kiMBeXE9PPkA6C2hiSCPg//ncPt2Moow=
X-Received: by 2002:aca:4b05:: with SMTP id y5mr3686677oia.70.1569403824192;
 Wed, 25 Sep 2019 02:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAJLOqRznfra3wQz5Gd7-KQw98AN8CuLozC1ZSZk8mupoJ+77RQ@mail.gmail.com>
 <20190925092541.GA8039@zx2c4.com>
In-Reply-To: <20190925092541.GA8039@zx2c4.com>
From: Brassy Panache <brassy.panache@gmail.com>
Date: Wed, 25 Sep 2019 19:30:13 +1000
Message-ID: <CAJLOqRy8Tg6E_B_riiRK_zXvfAFCmZ4Qdj9U5AAEdGMRrgeZag@mail.gmail.com>
Subject: Re: Error with wg-quick down when IPv6 not present
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:05:45 +0100
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
Content-Type: multipart/mixed; boundary="===============7332342076188506042=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7332342076188506042==
Content-Type: multipart/alternative; boundary="0000000000007342fe05935d4d29"

--0000000000007342fe05935d4d29
Content-Type: text/plain; charset="UTF-8"

I've just tested your patch and that works!  I no longer see the errors.  I
don't have a IPv6 environment to test with at the moment, so I cannot
verify that case.

On Wed, Sep 25, 2019 at 7:25 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Wed, Sep 25, 2019 at 11:06:18AM +1000, Brassy Panache wrote:
> > I have a kernel without IPv6 support.  I've noticed when running:
> >
> > $ wg-quick down vpn
> >
> >
> > I receive the following errors:
> >
> > [#] ip -4 rule delete table 51820
> > [#] ip -4 rule delete table main suppress_prefixlength 0
> > RTNETLINK answers: Address family not supported by protocol
> > Dump terminated
> > RTNETLINK answers: Address family not supported by protocol
> > Dump terminated
> > [#] ip link delete dev vpn
> > [#] resolvconf -d vpn -f
> >
> >
> > This is caused by the assumption that the command:
> >
> > $ ip -6 rule show
> >
> >
> > will run on the system.  I have made a change to my local wg-quick script
> > which first tests if the command runs successfully before it clears the
> > rules.  The same should probably also be done prior to running the IPv4
> > version of the command.
>
> Would this work?
>
> diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
> index e690944d..612ecd77 100755
> --- a/src/tools/wg-quick/linux.bash
> +++ b/src/tools/wg-quick/linux.bash
> @@ -102,10 +102,10 @@ del_if() {
>                 while [[ $(ip -4 rule show) == *"from all lookup main
> suppress_prefixlength 0"* ]]; do
>                         cmd ip -4 rule delete table main
> suppress_prefixlength 0
>                 done
> -               while [[ $(ip -6 rule show) == *"lookup $table"* ]]; do
> +               while [[ $(ip -6 rule show 2>/dev/null) == *"lookup
> $table"* ]]; do
>                         cmd ip -6 rule delete table $table
>                 done
> -               while [[ $(ip -6 rule show) == *"from all lookup main
> suppress_prefixlength 0"* ]]; do
> +               while [[ $(ip -6 rule show 2>/dev/null) == *"from all
> lookup main suppress_prefixlength 0"* ]]; do
>                         cmd ip -6 rule delete table main
> suppress_prefixlength 0
>                 done
>         fi
>
>

--0000000000007342fe05935d4d29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve just tested your patch and that works!=C2=A0 I no=
 longer see the errors.=C2=A0 I don&#39;t have a IPv6 environment to test w=
ith at the moment, so I cannot verify that case.</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 7:2=
5 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Wed, Sep 25, 2019 at 11:06:18AM +1000, Brassy Panache wrote:<br>
&gt; I have a kernel without IPv6 support.=C2=A0 I&#39;ve noticed when runn=
ing:<br>
&gt; <br>
&gt; $ wg-quick down vpn<br>
&gt; <br>
&gt; <br>
&gt; I receive the following errors:<br>
&gt; <br>
&gt; [#] ip -4 rule delete table 51820<br>
&gt; [#] ip -4 rule delete table main suppress_prefixlength 0<br>
&gt; RTNETLINK answers: Address family not supported by protocol<br>
&gt; Dump terminated<br>
&gt; RTNETLINK answers: Address family not supported by protocol<br>
&gt; Dump terminated<br>
&gt; [#] ip link delete dev vpn<br>
&gt; [#] resolvconf -d vpn -f<br>
&gt; <br>
&gt; <br>
&gt; This is caused by the assumption that the command:<br>
&gt; <br>
&gt; $ ip -6 rule show<br>
&gt; <br>
&gt; <br>
&gt; will run on the system.=C2=A0 I have made a change to my local wg-quic=
k script<br>
&gt; which first tests if the command runs successfully before it clears th=
e<br>
&gt; rules.=C2=A0 The same should probably also be done prior to running th=
e IPv4<br>
&gt; version of the command.<br>
<br>
Would this work?<br>
<br>
diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash<=
br>
index e690944d..612ecd77 100755<br>
--- a/src/tools/wg-quick/linux.bash<br>
+++ b/src/tools/wg-quick/linux.bash<br>
@@ -102,10 +102,10 @@ del_if() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while [[ $(ip -4 ru=
le show) =3D=3D *&quot;from all lookup main suppress_prefixlength 0&quot;* =
]]; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmd ip -4 rule delete table main suppress_prefixlength 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while [[ $(ip -6 ru=
le show) =3D=3D *&quot;lookup $table&quot;* ]]; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while [[ $(ip -6 ru=
le show 2&gt;/dev/null) =3D=3D *&quot;lookup $table&quot;* ]]; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmd ip -6 rule delete table $table<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while [[ $(ip -6 ru=
le show) =3D=3D *&quot;from all lookup main suppress_prefixlength 0&quot;* =
]]; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while [[ $(ip -6 ru=
le show 2&gt;/dev/null) =3D=3D *&quot;from all lookup main suppress_prefixl=
ength 0&quot;* ]]; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmd ip -6 rule delete table main suppress_prefixlength 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
</blockquote></div>

--0000000000007342fe05935d4d29--

--===============7332342076188506042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7332342076188506042==--
