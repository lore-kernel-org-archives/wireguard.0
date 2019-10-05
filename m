Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC87C432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:55:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA61C2070A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG/4XAvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA61C2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bde4fbd;
	Wed, 27 Nov 2019 09:55:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 678831a5
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 13:27:04 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 960885a6
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 13:27:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h2so8455648edn.3
 for <wireguard@lists.zx2c4.com>; Sat, 05 Oct 2019 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lR0aAFTMQmzcHIw9AHNMcKTpJ9pKz9LdZpARpTUTUzI=;
 b=CG/4XAvJySY4eVEg77rey54J1Nea7fPwdliWsZl/1nnewHnxpGo4sODdIMaOTBy7/5
 gb27fA8p2ecwFgkXbSoqaqgA5p2m1zPi+SJRVXG77991qFlR85rBp9fdDEUNuson6CER
 kwKcOCxY4PKlrGS+o9AdIPgcfeX8qYgqHyE2I76sY8mCdwCo2uAMoe0ecslQaeF6sjhg
 6KAV5+o4wxFyGUC4KDe3zN08Jr28wlDwxWp1Wc+dnKMrXYky3KDa3Km0BmEzayr0vvF5
 O5oQ3kaaJCebLaJCFFD1fD6URyKE042PNeAazfGc7cuGRUV4VnYOYTpptv989mVSOSu/
 YDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lR0aAFTMQmzcHIw9AHNMcKTpJ9pKz9LdZpARpTUTUzI=;
 b=mHuB6VLwWeJnkD/Hs2v7k1oSQsWNvM2KF+0f+KEhhgwFFrgZDvMSWxjasOzS3eX55i
 aI4k0adzbwIKsZD7zq1+kren+uI3KRG0lzpoFsdYHMGY87PZQNgxqqvqsSZh/9rRl288
 wHJngAzeZKYLK8ZEm9h/Izuztut1clVKb1/EE+tUmjrJIisq8ug8Y7Zp2ORWgqtQXKx9
 0SN4qmd8CxuRSWarSUDDgyd8edgsxC9oGtGEvEctmOm/ynVGLO/z2dJHb2Tnx78fwC1d
 azM/n3JMXWgp3X64xgddHkKkvG2jlD61BXX6s3RsqUEjF+9oMui79dPQfTXQ92Smm0z8
 9zJA==
X-Gm-Message-State: APjAAAWwxayUTUH15G+4AxrV+opwpH5hbGUJCGBcvQVQBmKrTzWdUdPq
 RfH/EvFXFS65JRKpq9pUtPlJuZ0oCExo8BIKDdA=
X-Google-Smtp-Source: APXvYqyJgte4NrRVXbVaY+DqXQ9AofG8V3uNZ1lJuwePMBFAhdY+v3E7oPOsVXC5oL2BNtBtUDn+10N9Fksx9JYp0+8=
X-Received: by 2002:a50:ed8e:: with SMTP id h14mr20428623edr.69.1570282023330; 
 Sat, 05 Oct 2019 06:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+kUo267JEndBxav--GABQ3o02ZXMOVmktB1ZW2R6Tzx-X0v-Q@mail.gmail.com>
 <CAEBQdhi6DrBPxT6RC6evvw8982GKcX9oKQO=2mN0OEoFp3GaeA@mail.gmail.com>
In-Reply-To: <CAEBQdhi6DrBPxT6RC6evvw8982GKcX9oKQO=2mN0OEoFp3GaeA@mail.gmail.com>
From: James <james.b.price@gmail.com>
Date: Sat, 5 Oct 2019 09:26:48 -0400
Message-ID: <CA+kUo25+N54mxu27091XqceXZ9J3rAmiAR-vxQzHam9dFkwh-w@mail.gmail.com>
Subject: Re: Strange firewall dnat rule to make WireGuard work on
 dual-interface
To: Simone Rossetto <simros85@gmail.com>
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:55:31 +0100
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
Content-Type: multipart/mixed; boundary="===============4632290999419153498=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4632290999419153498==
Content-Type: multipart/alternative; boundary="00000000000032a803059429c666"

--00000000000032a803059429c666
Content-Type: text/plain; charset="UTF-8"

Thanks for the reply.
I was able to get it to work. I had an issue with my iptables when trying
to copy and understand your example.
I was using the NEW and Related,established marking in the wrong way that
resulted in forward marks being cleared for related an established packets.
All good now. Your original post is the best I've found in regards to
required iptables entries for a dual interface setup.

I still think this behavior is in "bug territory". The wg server should be
replying with the same ip address that it received packets on.

On Fri, 4 Oct 2019 at 08:52, Simone Rossetto <simros85@gmail.com> wrote:

> Hi James
>
> Il giorno mer 25 set 2019 alle ore 10:51 James
> <james.b.price@gmail.com> ha scritto:
> > By design or lack of features, it ignores what the interface and IP the
> incoming packet was received on.
>
> Yes, it seams that.
>
> > I'm trying to do something similar to you but even with your IPtables I
> can't get mine to work. I have a more complicated setup and I can't seem to
> get the outbound packets to follow a routing table using a mark.
>
> Maybe I can help you... tell me which is your configuration and what
> you need to accomplish.
>
>
> Bye
> Simone
>

--00000000000032a803059429c666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the reply.=C2=A0<div>I was able to get it to wo=
rk. I had an issue with my iptables when trying to copy and understand your=
 example.</div><div>I was using the NEW and Related,established marking in =
the wrong way that resulted in forward marks being cleared for related an e=
stablished packets. All good now. Your original post is the best I&#39;ve f=
ound in regards=C2=A0to required iptables entries for a dual interface setu=
p.</div><div><br></div><div>I still think this behavior is in &quot;bug ter=
ritory&quot;. The wg server should be replying with the same ip address tha=
t it received packets on.</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 4 Oct 2019 at 08:52, Simone Rossetto=
 &lt;<a href=3D"mailto:simros85@gmail.com">simros85@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi James<br>
<br>
Il giorno mer 25 set 2019 alle ore 10:51 James<br>
&lt;<a href=3D"mailto:james.b.price@gmail.com" target=3D"_blank">james.b.pr=
ice@gmail.com</a>&gt; ha scritto:<br>
&gt; By design or lack of features, it ignores what the interface and IP th=
e incoming packet was received on.<br>
<br>
Yes, it seams that.<br>
<br>
&gt; I&#39;m trying to do something similar to you but even with your IPtab=
les I can&#39;t get mine to work. I have a more complicated setup and I can=
&#39;t seem to get the outbound packets to follow a routing table using a m=
ark.<br>
<br>
Maybe I can help you... tell me which is your configuration and what<br>
you need to accomplish.<br>
<br>
<br>
Bye<br>
Simone<br>
</blockquote></div>

--00000000000032a803059429c666--

--===============4632290999419153498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4632290999419153498==--
