Return-Path: <SRS0=jdnz=7N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F77C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 31 May 2020 19:34:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549AA206DA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 31 May 2020 19:34:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Txbo5aIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549AA206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7bc2f2a;
	Sun, 31 May 2020 19:18:44 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8dcba047
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 May 2020 19:18:42 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id m7so3386439plt.5
 for <wireguard@lists.zx2c4.com>; Sun, 31 May 2020 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=2qv7ZttoTw3jSx5Qm3LkozuH+6FDHKN3sLmhJB2oTUY=;
 b=Txbo5aIctsUYuWBjLScof6ivywpWt2z2IpoIRUKjvGoGieYK0QX10MDyMlRI+q0rLZ
 HlMjAaoC3KzZFY6TkiCWeDqiGVH9SYgcUccsfI/UKkos99vTUKj7msROkNL3YUsdpnbL
 PGRkfND+RmM0YXwsop1HJI6xdgUaqcMHQUWuYPJ5mf8X0jKr95wHbHCQRvS/++QCLDhf
 J71B1aG3znVS22xcLDFSFPqqjkHDoYFil4pURyn/qHADRIjVOJnVVCGUuR53vG6vAe+H
 z2x84SX+H86GvbZirXrfyj60J9G6YDyUBv43aCp7yW9gEQV0qtBgPECjbkJGsi27IKrL
 HVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=2qv7ZttoTw3jSx5Qm3LkozuH+6FDHKN3sLmhJB2oTUY=;
 b=McuHf7eiQ6YSpIAZZArl9lDxilLdSYLfURSup6Si/JXu3SxDjlyPCm+ipdubJR0ZqR
 BrOkX/qa33RpOl6JsQZQundBWosqGO55x13RM/ZEKCReGN7tVlI1kgJn3q+NhxUFgYZ2
 yFvY1NtSMLWW+rD2qPMn8DfPi2GmzDtr4B8dEP+Yd1GEwYv0ae7AxuthZINF9C5kLw+N
 R8LilWXeLZF9vKdB87FjPHQCu5VW7xT7d4zjyX9dj5PuhA9yiExGz2aa1og/IOEZhgZd
 k60KAZk3CKb3DPhd5HLFZtndrSAdcHfbAd+s7JdsrdrkKN4aNJol42IGxpKsyVMrCgRC
 ZlPQ==
X-Gm-Message-State: AOAM5318f+sor8DKjiNI3EAPGNLyKOocDzDN3tClE9xfBW1LtqmYQR3l
 s81yJkvbP7IDia4fN3rmR+EjQvKLNos9X4scEgo=
X-Google-Smtp-Source: ABdhPJzd0UNNhNHfhjBFXBzn1WYt4fUr+lXZSahPbqg1F3mn+mBSxWpuA+tMfYjx9Oa8Z0J4I9Fv7hvPWVVAqioebNs=
X-Received: by 2002:a17:90b:1108:: with SMTP id
 gi8mr7428344pjb.144.1590953677654; 
 Sun, 31 May 2020 12:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
 <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
 <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
 <CADGd2Dq3-EMBqA6bSKbR=C-pTZToPxv1xkM4BvYGh910T_e1Tg@mail.gmail.com>
 <CAHmME9q0mr_nF7rsWfFmNtAr6+6uv1yA=j6oJAoKZVXamH--zw@mail.gmail.com>
 <f88c4fdf-ff31-a489-cb58-c02309016b13@pallas.us>
 <CAF+AZZULw_O3wjeEkSnWsXOKs_uddr9=a0-04OroKNhsSnKqSw@mail.gmail.com>
 <cc7d0e96-eaae-458f-8dc4-0cd1228e5d83@www.fastmail.com>
In-Reply-To: <cc7d0e96-eaae-458f-8dc4-0cd1228e5d83@www.fastmail.com>
From: Mo Balaa <buddybalaa@gmail.com>
Date: Sun, 31 May 2020 14:34:26 -0500
Message-ID: <CAKmhVkoXP=jf3CU4L11mU9EU0DCraxRSn3JE+R5G9FSacCQG3w@mail.gmail.com>
Subject: Re: WireGuard over WireGuard
To: Justin Kilpatrick <justin@althea.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi All,

Reporting back on my progress after modify MTUs. Still seeing
significant intermittent stuck /hung connections on iOS in a
Wireguard over Wireguard tunnel (most apparent when using Twitter app for i=
OS)

Looking at getting Wireshark setup to do some debugging this afternoon
and would also appreciate any tips on how to go about figuring this
out.


Kind regards,

Mo

On Tue, May 12, 2020 at 6:17 AM Justin Kilpatrick <justin@althea.net> wrote=
:
>
> Althea uses WireGuard over WireGuard for mesh routing. Each device mainta=
ins a link to peers using WireGuard and then also maintains it's connection=
 to the exit over a multihop WireGuard connection.
>
> Building working WireGuard tunnels over fe80 ipv6 link local addresses wa=
s a real pain. Packets sometimes arrive only to the interfaced scoped addre=
ss and other times arrive without an interface scope. Requiring two tunnels=
 to successfully listen on one port.
>
> --
>   Justin Kilpatrick
>   justin@althea.net
>
> On Tue, May 12, 2020, at 2:56 AM, Dimitar Vassilev wrote:
> > Hi all,
> >
> > for my enlightenment can you please advise in which situation such
> > setups are useful?
> >
> > Thanks!
> >
> >
> > =D0=9D=D0=B0 =D1=87=D1=82, 7.05.2020 =D0=B3. =D0=B2 4:01 Derrick Lyndon=
 Pallas <derrick@pallas.us> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
> > >
> > > Note for the list: IPv6 has a minimum of 1280, which means 1360 in th=
e
> > > outer layer. ~Derrick
> > >
> > >
> > > On 5/6/20 4:54 PM, Jason A. Donenfeld wrote:
> > > > On Wed, May 6, 2020 at 5:28 PM John Lauro <johnalauro@gmail.com> wr=
ote:
> > > >> Wireguard is defaulting to 1420 MTU, the ethernet adapter is 1500 =
MTU,
> > > >> and I have IPv6 completely disabled.
> > > >>
> > > >> Can/should the MTU of wireguard be bumped to 1440?
> > > > You could if you wanted. But if you don't do it perfectly on all si=
des
> > > > with total uniformity and clearheadedness about your network design=
,
> > > > you'll run into subtle problems.
> >
