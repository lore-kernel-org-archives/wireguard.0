Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6D2C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Dec 2021 23:01:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7012441f;
	Fri, 10 Dec 2021 22:58:30 +0000 (UTC)
Received: from sonic310-57.consmr.mail.ir2.yahoo.com
 (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ad016cc5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Dec 2021 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1639046850; bh=UgUsnWcF8PEX+eP0t2C7TD85JUoxOcpH3HTOZgbZORM=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=SMPamOXdUsNixIn0RdGa+qWBaU4qn7SFYG5qxy4HV6sdrHVaWhb2+UJSyxRiFhg5KaIuQysVauf4J74L7/nfRK1C1TZQ638J8pf0cMJHYjJvRZTJO8O7Fg7B63aoNh2+MmktgtkqYzvh06z+Si3f2sq2AnqRM3PRvJFXGZUCv40Y81FQmzGERfOYcFGraSUp09pQwOFuE0IaSwwRIYngJN0T8DrUjCTCxBp6bF7MZ2zL9dHDGd9wae55HqvcBACoxEE8OJ0eM2zfh2Y5dF8m3cUO89biM0eFe1iKLXWstmUr7o6PvffYYH/hzUKRpodU03GUX3L3N+eM0JSHy7Gl4Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1639046850; bh=8ps6SgnPgtSH8urtZ3Ay0GLFgAWVgecZ4IBGOh7XzrQ=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=rvmyRmXEYwU330iZ2DE+RNE1LMkA2Z9V6vBwp57gV5IYGP9J2hkN1LTZZszm0caWLnJItU6/alxthLQUYv6xw/+A0smp8MaYNRIfyjeRpqHsaVcsWqGvSCPk+LIjnllOKSNz889VLnTkDTNg83qP9HrE9UbPW+przCNoy4ILo29fQ8fZiEZ9J8pUl//gcVl+kH0TVpPGGFzoJlhSd2Vvc3c4A29iVqZGaFcvffoz9vpm4XeyyuJF0B0b06CiY2/3dtl2qZVnlWEjNKMQ9GpBZn24m1NEuZLq8SySFK9s1fndQVKq9xcNkOSkFhqPB3ZDCrr+s/YfURso3Y7Wou5lJw==
X-YMail-OSG: Otpj30YVM1nmON3SQ44YBLyBFcOAWDJqghU.p_nM8yMFHq17S1LAc_GjQuXXa0h
 kVlfXsK7bIV_XotvpBXNZspqyS3ghoTkeM4cMuSzEjXDU.33WREdvM7wQ0wVQY1ZsWk.73jlE4Jm
 4Iy5uh5xVQ8FHjRAw4lJV9SWKhAP6yMJLmvBzyDoagC9Qn73OsN8KLj7ukLIWkqLDP3HgvjL4civ
 sa07FbrXsMIhNgouFnjzIjYgFNseLsAqly5LVVatovmeCnLMh0AKgQs4vXjfvWB3NKzT5Ux1J4Wc
 F1SXGTIyHMusfTapmjI1pWI3ku7kNzKdwXSjcL6QT9UDnHqnfsJx0T.dT3Ti81.9sj1kmHc.62QX
 uN6OWVbWEVcoIaRBgZamBcP0dgCWjWV42IiDcYOT963UfoSVgzWaXZLLgdR81wkHP9BM_KINqHak
 pzVBeI5zIdPKxbcz6U6amr5c1WhcJcqNUZ2CgMbKs9C1k9plZ8rK0mFarNAhC9clZRWLMTQpmGN6
 0kQNEKb3vvnesD_LUdP1.TZqII0Rs9CZ3gWIJqSIoHHmLWW63wU9TzgFFpDIjE69sALAjTEvMEda
 Hs5YS9CQR1W9Gr6GPAyEndHQpfGfkqaZO5QpCYXp0rg4oEcM1zbQzJjgbUEtsV8eJvHDOHPnOZ4l
 n3hI7ZwhW9YFEMyyOBDVNYuos5KRP5QL56CrE3K2jcJUyU.uyGeNsw.Nf7RXS8FJhD8oWU2TkGyb
 qG2juxKKZXucNM_nUjfmYjxQI93Z3EbQZZv57aqnIBTL6qnRCyBizCQN5M1YblgsvVX8nUSRYWYK
 RjOL6.cXbGPEcr5X9T84EfcHdnsduk_txT_7YLyJcX1Qv7JZh6ZuWsQIurqehkv22Z14GSeFlXeb
 _oMyQfvuZYZZZwCUiS6gvy4vOspNVODOjJzhPb7WTevU4ddkFUO7LCokOS22qTY4GhOxuNoaXmKU
 GZElxlEj2S9Y0g7ZCizFgg6PkkGV_KICaRAl8ToeOtVyeSmzcGsWNdgr51vnNx.VI5MobHCKawny
 F2zNp7LJrr_Ex6ox4SxwtU7QlYsZozw2AMj93nEl5x5zDynQNtSBpVCdN3QdwxN61ChWhmWAVeRx
 2xlpFLnRFa1e5dFzXKpg_hAMqEHZWcFrKD6Hw1c_hSMX6McXZq1q1TXw5IvZWVK7WmvangPeEiqO
 iNQjVybrOLYj.wUWMWMZo.RK7PozE95vRga8HLxLCM8L8qDbCiq8PZFkeGzZZuqyDs4PhM.D57Um
 RK_Y_iDCaLXr6OO4HE0bTKgWVWlqCahrl6Uwc1akZFWnz_JWL6K.hj6svQWEmxV11e4gLACp.zuT
 4XAlAZXv64UEJGNwHpo2rnMAdGvVRgHXPL8iVrBfBkJFjBY9tSkd1z6NmuFuqlqBdeA.Dxd0CdVb
 WUIK8TAR4WpAMtezqptcEW2Xm6ZbFqcJID66tNmnf7l4Q8nVX3Lzq5Q.TB.0sgd_LX90ssYqPjmD
 7ekeNSlsubKj8YVg57XjqNiVXU6H4OpHWRb_7QWX34JJESUvogbFAzKYpk6I0krGesX2vq.DTMYQ
 hmsdfqOKXX2Z_h80ti6U8DInsb.DAZsQu4FTtUblcO.FLe6F9cRYXnmvxlAwA.F_Ls0bzTimq7Ov
 2iVJoImrB84wssH8bYPihp6p6NGkDlDMnXbNx7h3AP.kN8iojhNBuybBPmQOQO0ocUzuK7.ngcXn
 Ct520YgnBnPjALDKMrcyHDyBD70L6AYJ0tdhGNkCOqZugHskgqmitLAvas231y9QyCMay_C6Tmmz
 kOgkUHdAXPxG5Zef9Vs94k2sgAVJ_pLrDg3OQFxB_7pjBfDIpUGQjiAEmIcIwuu9.eR65dfqHFzf
 oZUvunM9ZiR5zcF1X_tivyMJi1KSy.VHyxaOOMt2F7w_hk3tv0mXvRx_Zr5kfVxRi3OfU_.HVldQ
 S_7ZS0J26WsFErel_dcBbaQag.qFaVKS_z0ebbSv1tD0pr9Daf.JMaxQ6JC7dBX.luXpt9Ckkrcw
 ZfotNrb8uAS75QAZWfzmC_Mu9vO112e53PZ1ySJmaTlKi7Pu6hwhpRD0McyXq.Zi.y1HEybCHX3c
 esROsqJc8OKGwu4JQvq1SMPKXnylskIOfDAGBbEcAyTdbbMJ0bv3y2ajFN59pGUbHWF6OMWFav9f
 xUCiOcaNJ8z0oTwmEnvr6nhZ0o8HEXsjwj7Enk6dlW7X4ojDPhD1dLBSVPbkiK4Kf_oDiiFCPsIr
 RLXFDDh0I6rAVjLQ-
X-Sonic-MF: <powergame_coder2@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ir2.yahoo.com with HTTP; Thu, 9 Dec 2021 10:47:30 +0000
Date: Thu, 9 Dec 2021 10:47:26 +0000 (UTC)
From: Mehdi Haghgoo <powergame_coder2@yahoo.com>
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <1877736804.292900.1639046846065@mail.yahoo.com>
Subject: Cannot add wg0 on CentOS 8
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1877736804.292900.1639046846065.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19415 YMailNorrin
X-Mailman-Approved-At: Fri, 10 Dec 2021 22:58:27 +0000
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

Hi,

I'm trying to add=C2=A0 a wireguard device on CentOS Stream (was Linux just=
 converted to Stream).=20
When I enter "ip link add wg0 type wireguard" or try it using wg-quick wg0 =
up, I get the following error:=20

RTNETLINK answers: Operation not supported

I have wireguard-tools and kmod-wireguard installed.=20
Additional information:=20

uname -r: 4.18.0-147.8.1.el8_1.x86_64

wg --version: wireguard-tools v1.0.20210914 - https://git.zx2c4.com/wiregua=
rd-tools/

kmod-wireguard version: 1.0.20211208


Best regards,
Mehdi
