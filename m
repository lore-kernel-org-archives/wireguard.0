Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559E6CA6002
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d2620d17;
	Mon, 5 Oct 2026 06:56:29 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c4bea744
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2026 15:25:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so10722495e9.0
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2026 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785338710; x=1785943510; darn=lists.zx2c4.com;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :content-type:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LAocAFDQqp9pPxmwh1dwOxMc2OdJj5hEufGV3CxqPBo=;
 b=CpXWQx4o++16Gg5BQiUr2xiHfgo3fc+k51F0O5yNOiXJCL3XmQfX0ZrYJoXjoMOn4G
 aSXzkdj2pHNr4at0PNM6IUYWVvFJHK7U5AS+/BQQNk0W5ZAfivuvgK5CiaZUuUwPNg/3
 JkeSVbU0gownDNmb7uPpNcrHqcdW22W29B13775JQH9jnvyuHODn/vBAd0O4MlOOVq9/
 CWJA5anBXv4947rJSfvpEupZxIypUwnBPRPme8lkmeKKzH6PQsNojBI4AbuHCCadHLu0
 +7yaxv9xUrUnmsUPpZYKeOtHG6qyje+Fbm9bCQ2ZcXwZ69BmXMhO5JegvHsvDZ6kVnbk
 BrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785338710; x=1785943510;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :content-type:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LAocAFDQqp9pPxmwh1dwOxMc2OdJj5hEufGV3CxqPBo=;
 b=b/2GJxlGsP8T4YXiupLzBtD1f8Ay6zy9RxjQlSS420QPZyJRZOmQjme05DU0RG5Iy0
 JuVGGJfCVXc9zuiYSwLPPTy4zAbhhq6FuMmTFsKCJJWc4jpeQ+8kr7j99k8BITNKA5WZ
 +771EaHWAUiVLqtJdGcriqNlifF6xHdHSLLAyRwrch6kw1VX5q5sc5RADD27+BlHvNu7
 NhBgWXu/JzeoKpKhUeRWv5c11ElYUjYmx1p/KAF3v13u5VJxIpSAuTOHXsKkzS57AmRN
 j3li50O0ADBvwmTdmmB4TxA1t9lIlf2AVuVJmdx6JYSZTlnldgbsH80JiV3aQXVul1Ii
 Q4lg==
X-Gm-Message-State: AOJu0Yz9p4Eywq5l0iT29prkM0sTmrh9cRdpyWSMtHG/sHoY0MnERvvw
 WlwCXV6Y5FoEJ/HjAxIrzM1uFkvstROYGXwqzJDMPze+rzLPqdFD9rJWWrzY3N2SgTc=
X-Gm-Gg: AR+sD12BOV3U2cTEcWAs6ccNzlsaBkGSSCFJy1WrtAgYsQ0IVNvkwMup51UbBUjsYU0
 j0rzkG+2mrNloYC7ImeWv2YVoqfu3bdxvUbSvFpsUIqmvay1g1ih+cfrkj7ycPI8WtsosmWFUEI
 doucpTQXQOwSQt0uH7THXuzRM5mzNUFzcax+/Q52xXsBiPazWzRwp8xihd0AngSQWRPe/TejsH3
 GB2DQRPoBX0Gx5zcAwMrjFmlUazLYRoP4P2jcz64QMFDA4ZifHwB5lBGkqVe59lljBChkIuJ2EQ
 Mnh6lVd5Zg2frYEmOutyhHyNcgTNMjv9cvr7AqxH4tcFwqZMHYN0XTGH14CDGRPlLTiSS1gFdBz
 18NG+uNwIwaYuto6H6Nd9WSO6oYUEx5eiIysr2Kv7zdVTqyH7RBJ/wpkm9RkrWkWy07bG041IWz
 vnf7I1tc+UUoEtuitXXm8fEPyNdsnQO8dI/+2ynu42j1xws4oJCSdxuw7pyM1f1gheSXjRJmzl/
 4FHrCRFL/zPBJHbljj7EYpChR8JJjfyf6z+T0+wyqCXUJAsoEREvoHc
X-Received: by 2002:a05:600c:8b2e:b0:495:7952:64df with SMTP id
 5b1f17b1804b1-496c659f5a9mr97811265e9.36.1785338709511; 
 Wed, 29 Jul 2026 08:25:09 -0700 (PDT)
Received: from smtpclient.apple (lfbn-reu-1-426-50.w92-130.abo.wanadoo.fr.
 [92.130.250.50]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6b0ef25sm8620372f8f.24.2026.07.29.08.25.08
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jul 2026 08:25:08 -0700 (PDT)
From: David Berichon <davidberich@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: macOS: DNS configured via DNS= is not restored after wg-quick down 
Message-Id: <C4421D4C-0DF4-457A-8770-4D52142B2914@gmail.com>
Date: Wed, 29 Jul 2026 19:24:56 +0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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
I observed what seems to be an unexpected behavior with the Darwin =
implementation of wg-quick.
Environment
    =E2=80=A2 macOS
    =E2=80=A2 Homebrew wireguard-tools 1.0.20260223
    =E2=80=A2 wireguard-go backend
Minimal configuration
[Interface]
PrivateKey =3D ...
Address =3D 10.5.5.2/32
DNS =3D 10.5.5.7

[Peer]
PublicKey =3D ...
AllowedIPs =3D 0.0.0.0/0, ::/0
Endpoint =3D ...
PersistentKeepalive =3D 25
Steps to reproduce
Bring the tunnel up:
sudo wg-quick up ~/wireguard/pdc_mba.conf
The DNS is correctly configured:
networksetup -getdnsservers Wi-Fi
returns
10.5.5.7
The route monitor is also started:
pgrep -af "route -n monitor"
returns something similar to:
35140 route -n monitor
Then bring the tunnel down:
sudo wg-quick down ~/wireguard/pdc_mba.conf
The interface is correctly removed:
sudo wg show
returns no interfaces.
However the DNS configuration is not restored:
networksetup -getdnsservers Wi-Fi
still returns
10.5.5.7
instead of restoring the previous DNS configuration.
Additional observations
Running the script with:
sudo bash -x /opt/homebrew/bin/wg-quick down ~/wireguard/pdc_mba.conf
shows that cmd_down() removes the interface and executes PostDown, but =
does not explicitly invoke del_dns():
cmd_down() {
    execute_hooks "${PRE_DOWN[@]}"
    [[ $SAVE_CONFIG -eq 0 ]] || save_config
    del_if
    execute_hooks "${POST_DOWN[@]}"
}
I also noticed that del_dns() is only referenced from the =
monitor_daemon() trap:
trap 'del_routes; del_dns; exit 0' INT TERM EXIT
Is this expected behavior on macOS, or should the DNS configuration be =
restored after wg-quick down?
If this is expected, I=E2=80=99d appreciate understanding how the DNS =
restoration is intended to occur.
Thanks.=
