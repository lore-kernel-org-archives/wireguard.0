Return-Path: <SRS0=P56g=HA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4B8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 11:40:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6EC65062
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 11:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6EC65062
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 123331c8;
	Fri, 29 Jan 2021 11:40:10 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62481228
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 11:40:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 6so8512303wri.3
 for <wireguard@lists.zx2c4.com>; Fri, 29 Jan 2021 03:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id
 :references:to:date;
 bh=tmIp+l//0KRdI1IJKfTx52ej2+90ZpuXItmVtQaRVKI=;
 b=FTRptavxebGBoMDdLTNg4r16sGvqppJYXF8A6m+onWeePUrJaINZzYtSUg5wNPC/UT
 7hR24oPtecCNmBSd7JvmffXbmac2fcbj2XJ4yfGs8uAmdlyENqhWskKzMIv3KZvrqwjk
 j+s6L1IPvYi2MJkl+qvm7/NZbvX3/QG0m7XzaSfdmrN1ySqtlLYKUo8BdpUcZI/eeo1k
 DYZsS7b9zB5XdRciya7AQGiaZ6diOJsiMc46nhDc+PuN8dtOBLOgS/iyxuHhcUUH3jm4
 E9jxG/6gP8UPwiGGHd5pLyULxH6kuSWfUzsBTkWrakP8hwIgjg3vMT0iKMmY/7WFL+YG
 RsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:references:to:date;
 bh=tmIp+l//0KRdI1IJKfTx52ej2+90ZpuXItmVtQaRVKI=;
 b=ArgPt35P2SkiNSe3LFD4kksEAtaaJMqxZLhPbUsJVA93lS81XPX60HTJRoyMLKo3kV
 04hFJdG7DjwuNEX5Vj33tlxUTdeuQ8y/m9jNWHKbvqesWZmSZc3kwkzOZkgUIblLNxOa
 FBcHn1rmcuausTOOFcIu0uWzI25RqzJoOGRdZCf9ztq78YYERBv4p47tSlxlvUfGARO4
 yQ8hnkTYK8E29oQJHsRyGAjCA8qp4ZYQFKc7HpUgdtpdEctU8tIZgkYJi6DQPhLr2W2H
 50jSOLVQhwJeqwSgOSGuTvzFhCNg5Mgevgo1tzwcfteJaV0uBKJj4PYo4dOMValcDk48
 UTdA==
X-Gm-Message-State: AOAM5309wYUfbASwfERhzfl5GH8MRM49H6Rb7iC1ZpJXUIN3ngQ0flqa
 oUas9gWSGKXXmp+ciCc45sPHhVLukNKgQg==
X-Google-Smtp-Source: ABdhPJxetbr29DphAqhNXrC89HhRsINqAY7RwObrvTZrcqdQy/fg+MESdgKUOX5t5rimDymo9wi91A==
X-Received: by 2002:a05:6000:104:: with SMTP id
 o4mr4001733wrx.419.1611920408317; 
 Fri, 29 Jan 2021 03:40:08 -0800 (PST)
Received: from [10.71.26.223] ([194.99.104.12])
 by smtp.gmail.com with ESMTPSA id l7sm9955486wmg.41.2021.01.29.03.40.07
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 03:40:07 -0800 (PST)
From: Andrej Mihajlov <and@mullvad.net>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: =?utf-8?B?RndkOiBnaXQt0LTQvtGB0YLRg9C/INC6INC40YHRhdC+0LTQvdC4?=
 =?utf-8?B?0LrQsNC8IHdpcmVnYXJk?=
Message-Id: <7AF992B0-CE75-4581-A358-C1C46A252AE1@mullvad.net>
References: <op.0xy15fx8e0eir2@imac-hack.local>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Fri, 29 Jan 2021 12:40:06 +0100
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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



> Begin forwarded message:
>=20
> From: langry <eulangry@gmail.com>
> Subject: git-=D0=B4=D0=BE=D1=81=D1=82=D1=83=D0=BF =D0=BA =
=D0=B8=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D0=B8=D0=BA=D0=B0=D0=BC wiregard
> Date: 29 January 2021 at 09:06:40 CET
> To: and@mullvad.net
>=20
> =D0=94=D0=BE=D0=B1=D1=80=D1=8B=D0=B9 =D0=B4=D0=B5=D0=BD=D1=8C, =
=D0=90=D0=BD=D0=B4=D1=80=D0=B5=D0=B9.
>=20
> =D0=9D=D0=B5 =D0=BC=D0=BE=D0=B3=D1=83 =D0=BF=D1=80=D0=BE=D0=B1=D0=B8=D1=82=
=D1=8C=D1=81=D1=8F =D0=BA =D0=B8=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D0=B8=D0=BA=
=D0=B0=D0=BC =D0=BF=D0=BE =D0=B2=D0=B0=D1=88=D0=B5=D0=B9 =
=D0=B8=D0=BD=D1=81=D1=82=D1=80=D1=83=D0=BA=D1=86=D0=B8=D0=B8: =
https://git.zx2c4.com/wireguard-apple/about/
>=20
> "fatal: unable to access 'https://git.zx2c4.com/wireguard-apple/': =
error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert handshake =
failure"
>=20
> =D0=9F=D1=8B=D1=82=D0=B0=D1=8E=D1=81=D1=8C =D1=81=D0=BE=D0=B1=D1=80=D0=B0=
=D1=82=D1=8C =D0=BF=D0=BE=D0=B4 =D1=81=D1=82=D0=B0=D1=80=D1=8B=D0=B5 =
=D0=BC=D0=B0=D0=BA=D0=B8 =D0=B2=D0=B5=D1=80=D1=81=D0=B8=D0=B9 =
10.6=E2=80=9310.9=E2=80=A6 =D0=B8=D0=BB=D0=B8 =D0=B7=D1=80=D1=8F =
=D1=82=D1=80=D0=B0=D1=87=D1=83 =D0=B2=D1=80=D0=B5=D0=BC=D1=8F?
>=20
> --=20
> =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9

