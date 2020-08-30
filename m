Return-Path: <SRS0=5dvq=C3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFFBC43463
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:59:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A29402388B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alerinaldi-it.20150623.gappssmtp.com header.i=@alerinaldi-it.20150623.gappssmtp.com header.b="NCNZ6ASY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A29402388B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alerinaldi.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df0ee397;
	Fri, 18 Sep 2020 15:27:49 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a3ebd241
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 14:26:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id v4so2393432wmj.5
 for <wireguard@lists.zx2c4.com>; Sun, 30 Aug 2020 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alerinaldi-it.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=mggjmLxzNRDwHqPI6eZB2YLTSWVZt+8P2/ppL1A1/Mo=;
 b=NCNZ6ASYkw918Z9v2jxWy0NCz0G2u51RNsqJ2x1pc949hCP35XlUWjntx6l+MVHoAM
 HE+7pP50U+j7xVOcW4ULt4DNsbLEKFJatGtA1R0Ov1mWbnmY4ZfXvK48MNi8E02LiEUr
 OWbtKzKoU6hRZ7tayuhkJbyu7MDkiky6cqQd8cwIhSZABmmX/R1Z9vpRXCsnu7SZuX/R
 /UxVkJ6edVZoKWdf/vcylRjQzyxovxWI7cnO5Qp7fTfyL7o0pNo4x2rfR/L/tEiaQ6H2
 ACcE3CpDoh6Co1RCoZu17/QXPiLjn65BlbhUGHP8AtsUwEnvR6l1MFa9BNsAPij0ugrS
 nLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=mggjmLxzNRDwHqPI6eZB2YLTSWVZt+8P2/ppL1A1/Mo=;
 b=W3rnOfhmrtytI7gTObX4Nfo+OAjRZh9FrWIejgxaarUV30K0UjxH2NNBLEZanHepvt
 iuOn38DdJHSqak73w3OZ9LacvTLolcN6zfXChQo9Or9rIcfQv7Ls1Gk2f6fimJkKRjbp
 o8i61gecprWG4vtNPyZ9wl5JoZaDILYl7DMzv//4X1J0kMwl4ZDpMjEoCwXVqGB5kiPi
 LRHN9jw0HF262Wm6KjDfwjY6M/Ih1/CGFhr/tbj31Rh4g3OMpjV/l//6D6VL4eTkL8A+
 tQZojjNzUt6N5gJ0dcbdSSnDIof8ORex7L8Do/btCWIfwfIjwF24ddnhRKLdQ1bt45JM
 a/1A==
X-Gm-Message-State: AOAM530K8/I9Y7zbv3ML47CgpNr3dYMTFnz0aXvtuuTeY7Rpyp7lqpp3
 c+S064KMnD1po0zw6LhMD3KQIlsMpHeu33Ul1eGZBDQTTFyRzpUKTFY=
X-Google-Smtp-Source: ABdhPJzA44OX1oB/low3MvEIxUbCVMtx1wpVKS5tNZuK+3HlPjJjGSwPBlqX5+QKY3M1cjEBL91EJN4Ngz2Hoik7ti4=
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr6750221wmg.143.1598799232865; 
 Sun, 30 Aug 2020 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <CANtK_yx9zFK1Z4gm_SNC_rvveSoHEgTBrWscE5CeZaPuACUHbw@mail.gmail.com>
In-Reply-To: <CANtK_yx9zFK1Z4gm_SNC_rvveSoHEgTBrWscE5CeZaPuACUHbw@mail.gmail.com>
From: Alessandro Rinaldi <ale@alerinaldi.it>
Date: Sun, 30 Aug 2020 16:53:41 +0200
Message-ID: <CAJntV_ExhPJXMS4U9j8qvM68M4ckLFLyV1ei99b4_Mv0j2mdag@mail.gmail.com>
Subject: Re: Cannot set endpoint to localhost on windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 18 Sep 2020 17:27:47 +0200
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

Hello,
I have the exact same problem and it's preventing me from using
engarde[0] with the official Wireguard client on Windows. I reported
that to the mailing list some time ago.
Thanks for pointing that out again :)

[0] https://github.com/porech/engarde

On Sat, Aug 29, 2020 at 11:08 PM Hirbod Behnam
<chrome.hiri.angry@gmail.com> wrote:
>
> Hello
> I'm not sure if this is already reported or not but I found a small
> problem with the windows client of wireguard that does not allow users
> to use "plugins" on top of wireguard.
> So here is my case. I used gost to create a really simple port
> forwarder from my localhost to my server with this command: gost
> -L=3Dudp://127.0.0.1:12345/1.1.1.1:12345 (that forwards packets on port
> 12345 to 1.1.1.1:12345 and of course my server is not 1.1.1.1 :D)
> Also here is my wireguard config:
>
> [Interface]
> PrivateKey =3D xxxx
> Address =3D 10.9.0.2/24
> DNS =3D 8.8.8.8
> [Peer]
> PublicKey =3D xxxx
> AllowedIPs =3D 0.0.0.0/8,1.0.0.0/16,1.1.0.0/24,1.1.1.0/32,1.1.1.2/31,1.1.=
1.4/30,1.1.1.8/29,1.1.1.16/28,1.1.1.32/27,1.1.1.64/26,1.1.1.128/25,1.1.2.0/=
23,1.1.4.0/22,1.1.8.0/21,1.1.16.0/20,1.1.32.0/19,1.1.64.0/18,1.1.128.0/17,1=
.2.0.0/15,1.4.0.0/14,1.8.0.0/13,1.16.0.0/12,1.32.0.0/11,1.64.0.0/10,1.128.0=
.0/9,2.0.0.0/7,4.0.0.0/6,8.0.0.0/5,16.0.0.0/4,32.0.0.0/3,64.0.0.0/2,128.0.0=
.0/1
> Endpoint =3D 127.0.0.1:12345
> PersistentKeepalive =3D 25
>
> The allowed IPs are all ip addresses except 1.1.1.1.
> When I run the client, the log fills with: [TUN] [xxx-wg0] peer(xxx) -
> Failed to send data packet write udp4 0.0.0.0:58932->127.0.0.1:12345:
> wsasendto: The requested address is not valid in its context.
> And I cannot connect to anything. Sometimes in gost, it says that a
> connection is established but I still cannot connect to anything
> though wireguard.
>
> Also it's good to know that the exact config works fine with TunSafe,
> the official Ubuntu client and openvpn. (I can connect through gost)
> Thanks for the project!
> Hirbod
