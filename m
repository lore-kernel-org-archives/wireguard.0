Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EAAC64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:10:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a812fc0;
	Mon, 6 Mar 2023 23:06:38 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 921681ff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 09:51:54 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id y2so9177674pjg.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:content-transfer-encoding
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xMXRHI84JSPk4z74OaLOhRJQpX/uyvfnUtKjII8tYF8=;
 b=Md1iuCx5vIPlvuybDg+Td4+CtY0z7tYZhkk6DOr/BX9aEjm8JwAtt9gVNtDiSBOW+U
 PDZdf2Z/TYZlHE7Ym3HtmMBNLB9oYjLTH/qYryhBMw9f3jUxihlHHbnF5xZ0RkEfp5ul
 5TcYDfXthEPpoUcBsIgpxAIFoSYCI6ipyJn1OtbOhxJv043Iu5ykcrIKKjcDK9NKyu8l
 kcBdBscJEybyzcfx/P04t/GuIkHP5G/wy3xqV6OFx1idMsMsoQXBG7W0z1FCUnWgpbmO
 Sn1xeEZM0v63V8BzGR9vRPAHpz2FM5w2cTub74bY0OX4yQNlHxmcAAA2ehHgDOqr3B4J
 ytkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:content-transfer-encoding
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMXRHI84JSPk4z74OaLOhRJQpX/uyvfnUtKjII8tYF8=;
 b=UexzxyQ5TMjOBEsEBDjs8FEYsXu+oE1RhUBPg8iXCKe6jpsSSEvyxLTCRAjFUDCbD9
 WJjQqCtFCrkUZScjv8isQUOf/OiKXpEitcl51XDsnafl9hJ9+N3wRdx1m2MXO1SeTNqn
 JZyp3pZ+bG64UwfePrWivpdxHO5ag04r2qaGb+p6NnwJwKEsTgEN2xGVjAh41zWbByzl
 erTP1qtQwPbaK68XstqGiZIwgrxviI716HNNm/jVlUV2QjWASJL9mTczNkKPmGRmU/gZ
 JUnnpksWTtF29Qw5bX3ptqslDqdUd+Xkn6NqJJS4chBUAaktZp8QwxL8HtPA/Nh9hNsr
 nbjQ==
X-Gm-Message-State: AO0yUKWSHZD3/VAxqvsWKGUt0P2VOeSkifHy08E5pzsbIOIIsrIMYnhe
 fS0UXCtjkmm1kozSkKjzu0gIDT9MCKU=
X-Google-Smtp-Source: AK7set937BZ4psQvNsO50CTQardfqWKwgwCFML7mMnx3N51abRtaXZjrYDcsMIUM9psxMMDLNq+j5g==
X-Received: by 2002:a17:902:d506:b0:19e:2717:3de9 with SMTP id
 b6-20020a170902d50600b0019e27173de9mr13426230plg.52.1678096312654; 
 Mon, 06 Mar 2023 01:51:52 -0800 (PST)
Received: from localhost ([203.221.182.107]) by smtp.gmail.com with ESMTPSA id
 p18-20020a170902e75200b00194c2f78581sm6220590plf.199.2023.03.06.01.51.51
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:51:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Mar 2023 20:51:54 +1100
Message-Id: <CQZ7HWJCK18F.1AUR9FMHKPOXB@crawfs>
Subject: Possible regression between 5.18.2 and 6.2.1
From: "Dan Crawford" <dnlcrwfrd@gmail.com>
To: <wireguard@lists.zx2c4.com>
X-Mailer: aerc 0.14.0
X-Mailman-Approved-At: Mon, 06 Mar 2023 23:06:36 +0000
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

I recently updated a server from kernel version 5.18.2 to 6.2.1 and
discovered that WG clients could no longer connect; there were no
changes to configs. Reverting to 5.18.2 resolves the issue.

My server config looks something like

[Interface]
Address =3D 192.168.1.0/24
ListenPort =3D 51820
PrivateKey =3D XXX
PostUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -=
j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i=
 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey =3D XXX
AllowedIPs =3D 192.168.1.3/32

and my client config looks something like


[Interface]
Address =3D 192.168.1.3/32
DNS =3D 1.1.1.1
PrivateKey =3D XXX

[Peer]
AllowedIPs =3D 0.0.0.0/0
Endpoint =3D example.com:51820
PublicKey =3D XXX

On the server I get mysterious "packet has unallowed src ip" errors.
Playing around with various combinations of subnets and iptables
invocations doesn't seem to help. Was there a change to the config spec
that I missed? Or otherwise any other ideas what might be going on?

Thanks.
