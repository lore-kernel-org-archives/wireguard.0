Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4390FC46CD2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:25:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e01f5453;
	Wed, 20 Dec 2023 04:58:58 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cbf9cc76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 23:58:05 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-26d1e5f2c35so4247941a91.2
 for <wireguard@lists.zx2c4.com>; Wed, 23 Aug 2023 16:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692835083; x=1693439883;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wrwz8f0lL47SToE2ljw86gMnYN+pUzKJ9YnPs959xdc=;
 b=jdDf+Edm7MuAxcjcwsJGYckZ4RWGN/BL9dwOEt5ly3UVHmL+OoPlp6hYlWN1EfaM03
 unVOMYrCELut+JmuufMNb/9TLgQS3jMf5csWkxOjpaFllsIUrv4DeFZkxW0dpDLWgitW
 7Y+VoR74+Hue2TWixFkrl7wnltalQ3f8pDVw4icm7NctW5nKZzEZVMZp6tk3ZaCuGq94
 H+qu5CDmT3Tfcl+4v5b2bmBDZeSdw2qpbeXCU7HK+EPtfUZL6KnDa6R+Sf8KcBXqKmRC
 Da5Y0vzUBsSbvN9EEfXKnxc0w/4mfN8lvd8C4mgVWnzbRDyJ0yi9mFliBAG66tLGNv6r
 1vsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692835083; x=1693439883;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wrwz8f0lL47SToE2ljw86gMnYN+pUzKJ9YnPs959xdc=;
 b=MGevpGVvIliCod0TKDcImb91uY8IBAw2+vWEGs91ao1bKL2Vo0M6gCK9XatkPXhLh0
 QEHKLUkKVnEcGH70Wsi3Sg36xajWLWoZKGB9PTZRD8Bju0SuP2H+TWTYfGwnQPXj7q8T
 Z6ZxePQp0GLYXpEP0b/42fePy79ziVDWhIdBpXDQFjbad1+NPnmR8feLkQqpKNSBH9TC
 /s72oVxZJ9GNHytflTOSxnyQv9P0OQ0/sVCnWXxIE8ZLEvfeH+uk7RJiWjH6JDfJiqmG
 xtOdzDzGlSAYgcb+ZnakG7Ss7g3MZV/rNe+WSNVw69xwhzxrxEp7gPBXoZmP6G5+8bB4
 6zpw==
X-Gm-Message-State: AOJu0Yy+FOa5Krr4ont6ajUWCUlb95fXqh8MKyCbHuI55kxfKITRmjul
 D4+E+p1SrndBwZGPtlxyjNYtn2RbHAsnPc3Yr4z61WHPiTs=
X-Google-Smtp-Source: AGHT+IFdAsBhTn3qXDz3CdSTEz3fGCPtdj7/WbWn9wPYxC870fA30SgohBK3TIAlEkYQ+tyXk84jW28sgnvKtC/0JT0=
X-Received: by 2002:a17:90a:ee87:b0:268:4485:c868 with SMTP id
 i7-20020a17090aee8700b002684485c868mr11353141pjz.49.1692835082919; Wed, 23
 Aug 2023 16:58:02 -0700 (PDT)
MIME-Version: 1.0
From: Mighty Guava <mightyguava@gmail.com>
Date: Wed, 23 Aug 2023 19:57:51 -0400
Message-ID: <CAL9uZM8JHTrse+T8GE9k3sNVdKCh3MPQaU_nW28dOpOqAJn+ow@mail.gmail.com>
Subject: Issues starting Wireguard connection on Mac and iOS
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Hi all,

I=E2=80=99ve been having issues with the iOS (iPhone 12) and Mac (MacBook M=
1)
clients for Wireguard when starting a connection. It usually takes
several attempts to start a connection. Specifically, one of the
following things occur when activating Wireguard:

* It shows =E2=80=9CData sent: 148b=E2=80=9D, incrementing a small amount e=
very 5
seconds-ish with nothing showing for Data Received.
* It shows =E2=80=9CData received: 96b=E2=80=9D incrementing a small amount=
 every 5
seconds, while =E2=80=9CData sent=E2=80=9D is going up by about 20MB/s ever=
y second,
effectively saturating my uplink. Statistics on my router does show
the data actually going somewhere. Wireguard logs on the peer it=E2=80=99s
connecting to though do not show anything unusual.

In both cases, the connection isn=E2=80=99t actually successful, and I am
unable to access vpn network. The connection is successful for me
about 1 out of 5 times, though it=E2=80=99s not deterministic.

I=E2=80=99ve had no issues connecting from an Android client. It succeeds
every time. When my Mac or iOS clients succeed in making a connection,
I also see no problems.

The same issue occurs when connecting to 3 completely different peers
from the Mac/iOS device: 1 running Raspberry Pi OS (Debian based), 1
running weejewel/wg-easy Docker container, 1 running on an Asus
RT-AX86U Router using their software. All wireguard packages up to
date.

I=E2=80=99ve tried upping MTU to 1500 and shortening keep alive but neither=
 successful.

There=E2=80=99s a serverfault topic for this issue as well (not created by =
me)
with several people reporting similar experiences.
https://serverfault.com/questions/1129770/wireguard-clients-need-to-make-ma=
ny-attempts-to-connect-before-receiving-data

Client config below:

[Interface]
PrivateKey =3D <pub key>
Address =3D 10.6.0.3/32

[Peer]
PublicKey =3D <pub key>
AllowedIPs =3D 0.0.0.0/0
Endpoint =3D <server address>
PersistentKeepalive =3D 25

DNS is pointed to an internal DNS server on my intranet. I've tried
removing it to not override DNS, but it does not seem to have an
impact.

Hoping someone on this list has leads on how I might be able to fix this.

Thanks,
Yunchi
