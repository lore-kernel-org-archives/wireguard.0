Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E021CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 00:52:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC95E23447
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 00:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC95E23447
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0befadf2;
	Fri, 8 Jan 2021 00:51:00 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e8dcc7c7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 00:50:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 33B8D5C021D
 for <wireguard@lists.zx2c4.com>; Thu,  7 Jan 2021 19:50:57 -0500 (EST)
Received: from imap7 ([10.202.2.57])
 by compute6.internal (MEProxy); Thu, 07 Jan 2021 19:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=iD0Iw
 ENELno5LKaDWMBJg/P2WjlVM0OuYJQ+m9VGaBY=; b=Xv6GgoeQ1I6TCQavIAouT
 +e35bAYRmyrrBB7Bq4rQKwN3cd3zvzq7Dnv4Q5zUE/DH4JDkAz3ecNtkVXBnLEJX
 TaVNq2FbAe/7fugIJwvhFM5FQAn2I8Ha9pfqPLKK+rq8GyEUqVGzynfet2pshoxP
 oevHgMkAmpDbAv6P/3eReOHrYq2Pb7J0BGyFzI6FIiuZYx2XmswUYmpl5k0kCjVt
 jz8qIxppZw0Ci5JlXySrtVgee3dkHkEk/FbiWHTngu2zd43+Yt7SEvP6rToEwPw2
 6I64OFysoPqDUPYjrbhOpIODQ2yQe+raGvhsGiRmjtbHnQHcgDXrlGS1wcl58Ucb
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=iD0IwENELno5LKaDWMBJg/P2WjlVM0OuYJQ+m9VGa
 BY=; b=o3weXm9DwUl5NozcVx1k+Jrb78mBcPA0gC6eehSXa1twdCge0NmMbwpFL
 6QHUt83d0XCzu7hbV1rEsTiLZFAzF6zqlw3ZCX4FPxkESmBGMJHyWCq14m/Lq1EZ
 MxmGMkxqPC+zNjbP18etQ1qG6B/ErCgcZAJkfCs3LhWozj5hOq4hFI982pmyBtwo
 r/yMDgVkJ6MaCachUxQevS2q6gJuoi2uCXZ/FtxKQVjj2ONYGZFYjRcU89zIg2Gq
 YUXmAEbe99PzagWQEGaEiXTDMfjPilI4DbmB5Yk70YCeD+X3662BSFwr0N6EzI8W
 GIToh2xMCuN23IItjCIMncTFZPo2Q==
X-ME-Sender: <xms:cKz3X5KjfoTu0GCRqNVPKthxIjNSXhEE9KfVB6g2qLh9EzDyy3Ydzg>
 <xme:cKz3X1Ltbt9Vrh_rXSnAaSTUaPdpu48Z7XYQLgWV3g0_TvFvevJ9oxfIu7KJ_g7xW
 EIxMbsLVPn_xDbsDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfgfhr
 ihgtucfnihhghhhtfdcuoegvrhhitgesvghrihgtlhhighhhthdrtghomheqnecuggftrf
 grthhtvghrnhepgeehtdelvdetueekgfekkeeiffeugfffteekueejvdegffejffdthedv
 heelueehnecuffhomhgrihhnpehsvghnthgvnhgtrdgvshdptghuuggrshhvtgdrtghomh
 dpiiigvdgtgedrtghomhdpshihiihkrghllhgvrhdrrghpphhsphhothdrtghomhdpphhh
 ohhrohhnihigrdgtohhmnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
 hilhhfrhhomhepvghrihgtsegvrhhitghlihhghhhtrdgtohhm
X-ME-Proxy: <xmx:caz3XxsQa6a-TQhZbcLFl9sphDNP_geWB2zVdrhaJtENnc0nSdPmBw>
 <xmx:caz3X6aJ1ZPIm2bRk1IrifRBhHWZsdCaciSi1Si1OnbUnfrdvAKvnA>
 <xmx:caz3XwaE4uADod2ckUCBo5rCWdcWP40P5ITpEt3jZqb0GzVFMxRtpQ>
 <xmx:caz3X_nL2zir6rC98XDHPeHtt6kLQtE2e6RaX2nY_wzb-rsgRz6C8A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DCC011800A8; Thu,  7 Jan 2021 19:50:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <3171d75d-f4a8-40df-9208-5b40f732dfea@www.fastmail.com>
In-Reply-To: <AB0E5484-9274-4079-9A94-E464E218689E@morsecom.com>
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
 <CA5B0431-801C-4F2E-85F5-E329F02D364A@morsecom.com>
 <0029bece-0f7e-4467-948d-b48af50e5bca@www.fastmail.com>
 <AB0E5484-9274-4079-9A94-E464E218689E@morsecom.com>
Date: Fri, 08 Jan 2021 13:50:36 +1300
From: "Eric Light" <eric@ericlight.com>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
Content-Type: text/plain;charset=utf-8
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

@List - I'll reach out to Corey directly and try to help.  Sorry for the=
 noise.

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Fri, 8 Jan 2021, at 13:44, Corey Costello wrote:
> Yeah, it doesn=E2=80=99t work for me :(=20
>=20
> > On Jan 7, 2021, at 7:42 PM, Eric Light <eric@ericlight.com> wrote:
> >=20
> > Corey - have you tried unsubscribing at the unsubscribe page?  https=
://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.zx2c4.com%2fmailm=
an%2foptions%2fwireguard&c=3DE,1,Axa-ElbX0arA0gS27knqMcMnUXikmpGux0uV7Gv=
66JniMpXRVVtWNeYE8mu17nQawpfQEodteBfH9tq43ronGkmm07T_Tq9urTmtYLTTK8YwFg,=
,&typo=3D1
> >=20
> > Hope this helps,
> >=20
> > E
> >=20
> > --------------------------------------------
> > Q: Why is this email five sentences or less?
> > A: https://linkprotect.cudasvc.com/url?a=3Dhttp%3a%2f%2ffive.sentenc=
.es&c=3DE,1,L28_oBFr0CKAXDsG0BiDkDDhOYaG4FoH7vdeaKoqnsVwn14kiz9J_PpjMZAo=
Itr_wdFvmWS4wAI7qDgBPljT8qxgdAwCA9Vy54M3bcq8nJBKnA11GFTTG6BEv04,&typo=3D=
1
> >=20
> > On Fri, 8 Jan 2021, at 13:34, Corey Costello wrote:
> >> Get me off this fucking list ffs.
> >>=20
> >>=20
> >>=20
> >>> On Jan 7, 2021, at 2:06 PM, Jeffrey Walton <noloader@gmail.com> wr=
ote:
> >>>=20
> >>> On Thu, Jan 7, 2021 at 2:03 PM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
> >>>>=20
> >>>> On Thu, Jan 7, 2021 at 1:22 PM Dmitry Vyukov <dvyukov@google.com>=
 wrote:
> >>>>>=20
> >>>>> On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4=
.com> wrote:
> >>>>>>=20
> >>>>>> ...
> >>>>>=20
> >>>>> These UBSAN checks were just enabled recently.
> >>>>> It's indeed super easy to trigger: 133083 VMs were crashed on th=
is already:
> >>>>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fsyzkaller.=
appspot.com%2fbug%3fextid%3d8f90d005ab2d22342b6d&c=3DE,1,RVpgZsRUCGs2jKl=
umiMAMnpeOF4QdiW5h8GDIsBJPz-orFNwvwCXnceC9n5Bhr1h-G2EsU0tlC7N4QUpHuF6tIM=
I7tTnBoRjAo5tT-Bk9-Fhe8CppuOL4mqdkA,,&typo=3D1
> >>>>> So it's one of the top crashers by now.
> >>>>=20
> >>>> Ahh, makes sense. So it is easily reproducible after all.
> >>>>=20
> >>>> You're still of the opinion that it's a false positive, right? I
> >>>> shouldn't spend more cycles on this?
> >>>=20
> >>> You might consider making a test build with -fno-lto in case LTO i=
s
> >>> mucking things up.
> >>>=20
> >>> Google Posts Patches So The Linux Kernel Can Be LTO-Optimized By
> >>> Clang, https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fwww.p=
horonix.com%2fscan.php%3fpage%3dnews_item%26px%3dLinux-Kernel-Clang-LTO-=
Patches&c=3DE,1,7u3-jWadklYo8ai_XrPNvjnu46LLAyg0hqsGIaMPaoQ5UxtcNM84jrHU=
gSg4VciXKk9XVpwgyBwD85LbbW5_j195jSH6RrAej45I1kr_XfQ,&typo=3D1
> >>>=20
> >>> Jeff
> >>=20
> >>=20
>=20
>
